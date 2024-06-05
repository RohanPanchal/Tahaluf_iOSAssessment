//
//  UniversityModel.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    @objc dynamic var alphaTwoCode: String = ""
    var domains = List<String>()
    @objc dynamic var name: String = ""
    var webPages = List<String>()
    @objc dynamic var country: String = ""
    @objc dynamic var stateProvince: String = ""

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case domains, name
        case webPages = "web_pages"
        case country
        case stateProvince = "state-province"
    }
}
