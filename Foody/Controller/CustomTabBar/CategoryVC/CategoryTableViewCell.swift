//
//  CategoryTableViewCell.swift
//  Foody
//
//  Created by Sarvesh Patel on 14/02/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
