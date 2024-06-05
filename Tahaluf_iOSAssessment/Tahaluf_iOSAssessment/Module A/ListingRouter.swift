//
//  ListingRouter.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import UIKit

protocol ListingRouterProtocol {
    static func createListingModule() -> UIViewController
    func navigateToDetails(with item: University)
}

class ListingRouter: ListingRouterProtocol {
    weak var viewController: UIViewController?

    static func createListingModule() -> UIViewController {
        let view = ListingViewController()
        let interactor = ListingInteractor()
        let presenter = ListingPresenter()
        let router = ListingRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter as? any ListingInteractorOutputProtocol
        router.viewController = view

        return view
    }

    func navigateToDetails(with item: University) {
        // Navigate to details screen passing the selected item
        let detailsViewController = DetailsViewController()
        detailsViewController.selectedUniversity = item
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
