//
//  StudentTableViewCell.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    static let identifier = "StudentCell"
    @IBOutlet weak var studentName : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

