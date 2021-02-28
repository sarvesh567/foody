//
//  CustomTabBar.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class CustomTabBar: UITabBarController {

    
    var subCatIdStr = ""
    var  catIdStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tabBar.isTranslucent = false
        
        self.tabBar.isOpaque = true
       // let font = UIFont(name: "Spartan-SemiBold", size: 18.0)
        var tabBarItem: UITabBarItem!
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1)], for: .selected)
       // UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Spartan-SemiBold", size: 30)], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        
        
        
        let selectedHomeImage = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1), renderingMode: .alwaysOriginal)
        let deSelectedHomeImage = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.darkGray, renderingMode: .alwaysOriginal)
        tabBarItem = self.tabBar.items![0]
        tabBarItem.image = deSelectedHomeImage
        tabBarItem.selectedImage = selectedHomeImage
       
        
        
        
        let selectedCategoryImage = UIImage(named: "featured")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1), renderingMode: .alwaysOriginal)
        let deSelectedCategoryImage = UIImage(named: "featured")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.darkGray, renderingMode: .alwaysOriginal).withTintColor(UIColor.darkGray)
        tabBarItem = self.tabBar.items![1]
        tabBarItem.image = deSelectedCategoryImage
        tabBarItem.selectedImage = selectedCategoryImage
 
        
        let selectedfavouriteImage = UIImage(named: "services")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1), renderingMode: .alwaysOriginal)
        let deselectedfavouriteImage = UIImage(named: "services")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.darkGray, renderingMode: .alwaysOriginal).withTintColor(UIColor.darkGray)
        tabBarItem = self.tabBar.items![2]
        tabBarItem.image = deselectedfavouriteImage
        tabBarItem.selectedImage = selectedfavouriteImage



        let selectedNotificationImage = UIImage(named: "notification")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1), renderingMode: .alwaysOriginal)
        let deselectedNotificationImage = UIImage(named: "notification")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.darkGray, renderingMode: .alwaysOriginal).withTintColor(UIColor.darkGray)
        tabBarItem = self.tabBar.items![3]
        tabBarItem.image = deselectedNotificationImage
        tabBarItem.selectedImage = selectedNotificationImage


        let selectedMeImage = UIImage(named: "me")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1), renderingMode: .alwaysOriginal).withTintColor(UIColor(red: 0/255, green: 207/255, blue: 132/255, alpha: 1))
        
        let deselectedMeImage = UIImage(named: "me")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.darkGray, renderingMode: .alwaysOriginal).withTintColor(UIColor.darkGray)
        tabBarItem = self.tabBar.items![4]
        tabBarItem.image = deselectedMeImage
        tabBarItem.selectedImage = selectedMeImage

        
        self.selectedIndex = 0
        

        
    }
    

    

}
