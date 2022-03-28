//
//  CustomSchoolTableCellTableViewCell.swift
//  20210927-SushreeSangitaNayak-NYCSchools
//
//  Created by SUSHREE SANGITA NAYAK on 9/27/21.
//

import UIKit

/* Reuable Table view cell */
class CustomSchoolTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
