//
//  ListingPresenter.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation

protocol ListingPresenterProtocol {
    var view: ListingViewProtocol? { get set }
    var interactor: ListingInteractorInputProtocol? { get set }
    var router: ListingRouterProtocol? { get set }

    func viewDidLoad()
    func didSelectItem(_ item: University)
    func didTapRefresh()
}

class ListingPresenter: ListingPresenterProtocol {
    var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var router: ListingRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchItems()
    }

    func didSelectItem(_ item: University) {
        router?.navigateToDetails(with: item)
    }

    func didTapRefresh() {
        interactor?.fetchItems()
    }
}
