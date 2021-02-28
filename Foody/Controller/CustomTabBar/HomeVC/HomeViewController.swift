//
//  HomeViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class HomeViewController: UIViewController {

   
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var tableView1: UITableView!
    
    var homeOurCategoryResponseModelArray = [HomeOurCategoryResponseModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        getHomeApi()
        
    }
}
    
extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeOurCategoryResponseModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.imgView.sd_setImage(with: URL.init(string: self.homeOurCategoryResponseModelArray[indexPath.item].image.trimURLString()) , placeholderImage : UIImage(named : "placeholder"))
        cell.nameLabel.text = self.homeOurCategoryResponseModelArray[indexPath.item].name
          
        return cell
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print("moved")
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
}


