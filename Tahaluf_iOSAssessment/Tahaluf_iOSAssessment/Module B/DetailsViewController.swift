//
//  DetailsViewController.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import UIKit

class DetailsViewController: UIViewController {
    var selectedUniversity: University?
    
    @IBOutlet var lblUniversityName: UILabel?
    @IBOutlet var lblUniversityState: UILabel?
    @IBOutlet var lblUniversityCountry: UILabel?
    @IBOutlet var lblUniversityCountryCode: UILabel?
    @IBOutlet var lblUniversityWebPage: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setData()
    }
    
    func setData() {
        lblUniversityName?.text = selectedUniversity?.name
        lblUniversityState?.text = selectedUniversity?.stateProvince
        lblUniversityCountry?.text = selectedUniversity?.country
        lblUniversityCountryCode?.text = selectedUniversity?.alphaTwoCode
        lblUniversityWebPage?.text = selectedUniversity?.webPages.first
    }
}
