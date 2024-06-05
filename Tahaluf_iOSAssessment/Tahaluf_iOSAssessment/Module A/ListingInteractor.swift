//
//  ListingInteractor.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation
import RealmSwift

protocol ListingInteractorInputProtocol {
    var presenter: ListingInteractorOutputProtocol? { get set }

    func fetchItems()
}

protocol ListingInteractorOutputProtocol {
    func itemsFetched(_ items: [University])
    func fetchFailed(with error: Error)
}

class ListingInteractor: ListingInteractorInputProtocol {
    var presenter: ListingInteractorOutputProtocol?
    let realm = try! Realm()

    func fetchItems() {
        // Fetch items from API
        APIService.shared.fetchUniversities { [weak self] result in
            switch result {
            case .success(let items):
                // Cache items in local DB
                try! self?.realm.write {
                    self?.realm.add(items, update: .all)
                }
                self?.presenter?.itemsFetched(items)
            case .failure(let error):
                // If API fails, try fetching from local DB
                if let cachedItems = self?.realm.objects(University.self) {
                    //self?.presenter?.itemsFetched(cachedItems)
                } else {
                    self?.presenter?.fetchFailed(with: error)
                }
            }
        }
    }
}
