//
//  RestaurantCollectionViewCell.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class MyButton : UIButton {

var row : Int?
var section : Int?

}

protocol CelltapDelegate:NSObjectProtocol {
    func didpressCell(section:Int, row: Int, favouriteBool: Bool)
}

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
}
