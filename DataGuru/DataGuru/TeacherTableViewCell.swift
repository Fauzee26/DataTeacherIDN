//
//  TeacherTableViewCell.swift
//  DataGuru
//
//  Created by Muhammad Hilmy Fauzi on 10/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblPelajaran: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
