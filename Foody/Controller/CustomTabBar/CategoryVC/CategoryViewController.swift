//
//  CategoryViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit
import SwiftyJSON

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView1: UITableView!
    var categoryResponseModelArray = [CategoryResponseModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView1.tableFooterView = UIView()
            self.getCategoryApi()
    }
}
    
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryResponseModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryTableViewCell = tableView1.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        cell.nameLabel.text = categoryResponseModelArray[indexPath.row].name
        cell.discriptionLabel.text = categoryResponseModelArray[indexPath.row].describe
        
        cell.backgroundImageView.sd_setImage(with: URL.init(string: self.categoryResponseModelArray[indexPath.row].image.trimURLString()) , placeholderImage : UIImage(named : "placeholder"))
        cell.logoImageView.sd_setImage(with: URL.init(string: self.categoryResponseModelArray[indexPath.row].icon.trimURLString()) , placeholderImage : UIImage(named : "placeholder"))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControler = UIStoryboard.subCategoryViewController()
        viewControler.catIdStr = categoryResponseModelArray[indexPath.row].id
        
        viewControler.titleStr = categoryResponseModelArray[indexPath.row].name
        
        UserDefaults.standard.setValue(self.categoryResponseModelArray[indexPath.item].name, forKey: "title")
        
        present(viewControler, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //  return UITableView.automaticDimension
        return 190
    }
        
}
