//
//  UniversityCell.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import UIKit

class UniversityCell: UITableViewCell {
    @IBOutlet var lblUniversityName: UILabel?
    @IBOutlet var lblUniversityState: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
