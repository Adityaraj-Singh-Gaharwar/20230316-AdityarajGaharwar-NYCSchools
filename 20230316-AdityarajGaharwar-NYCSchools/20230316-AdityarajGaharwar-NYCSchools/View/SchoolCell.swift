//
//  SchoolCell.swift
//  20230316-AdityarajGaharwar-NYCSchools
//
//  Created by Adityaraj Singh Gaharwar on 17/03/23.
//

import UIKit

class SchoolCell: UITableViewCell {

    @IBOutlet weak var imgSchool: UIImageView!
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblSchoolLocation: UILabel!
    
    var schoolDetails : SchoolListModel? {
        didSet {
            if let details = schoolDetails {
                self.lblSchoolName.text = details.school_name ?? "NA"
                self.lblSchoolLocation.text = details.location ?? "NA"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
