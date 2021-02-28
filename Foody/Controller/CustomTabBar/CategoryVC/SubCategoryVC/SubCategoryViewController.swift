//
//  SubCategoryViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 14/02/21.
//

import UIKit

class SubCategoryViewController: UIViewController {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var subCategoryResponseModelArray  =  [SubCategoryResponseModel]()
    var catIdStr: String = ""
    var titleStr = ""
    var selectedIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getSubCategoryApi()
        self.categoryNameLabel.text! = "Select" + " " + "\(titleStr)" + " " + "Category"

    }
}
extension SubCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.subCategoryResponseModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionViewCell", for: indexPath) as! SubCategoryCollectionViewCell
        
        cell.nameLabel.text = self.subCategoryResponseModelArray[indexPath.row].name
        cell.logoImageView.sd_setImage(with: URL.init(string: self.subCategoryResponseModelArray[indexPath.row].image.trimURLString()) , placeholderImage : UIImage(named : "placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        self.collectionView1.reloadData {
            UserDefaults.standard.setValue(self.catIdStr, forKey: USER_DEFAULTS_KEYS.CATEGROY_ID)
            UserDefaults.standard.setValue(self.subCategoryResponseModelArray[indexPath.item].id, forKey: USER_DEFAULTS_KEYS.SUB_CATEGROY_ID)
            
            let viewController = UIStoryboard.customTabBar
            viewController().subCatIdStr = self.subCategoryResponseModelArray[indexPath.row].id
            viewController().catIdStr = self.catIdStr
            self.present(viewController(), animated: true, completion: nil)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 158)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
    
    
    
}
