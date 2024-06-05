//
//  ListingViewController.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import UIKit

protocol ListingViewProtocol {
    func showItems(_ items: [University])
    func showError(_ message: String)
}

class ListingViewController: UIViewController {
    var presenter: ListingPresenterProtocol?
    
    @IBOutlet var tblUniversityList : UITableView?
    var arrUniversities = [University]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        registerTableViewCells()
        tblUniversityList?.delegate = self
        tblUniversityList?.dataSource = self
    }
}

extension ListingViewController: ListingViewProtocol {
    func showItems(_ items: [University]) {
        // Update UI with items
        
        arrUniversities = items
        tblUniversityList?.reloadData()
    }

    func showError(_ message: String) {
        // Display error message
    }
}

extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    func registerTableViewCells() {
        let universityCell = UINib(nibName: "UniversityCell", bundle: nil)
        self.tblUniversityList?.register(universityCell, forCellReuseIdentifier: "UniversityCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUniversities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as? UniversityCell

        cell?.backgroundColor = .red
        cell?.lblUniversityName?.text = self.arrUniversities[indexPath.row].name
        cell?.lblUniversityState?.text = self.arrUniversities[indexPath.row].stateProvince

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(arrUniversities[indexPath.row])
    }
}
