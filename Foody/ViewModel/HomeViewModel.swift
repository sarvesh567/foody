//
//  HomeViewModel.swift
//  Foody
//
//  Created by Sarvesh Patel on 14/02/21.
//

import Foundation

extension HomeViewController{
func getHomeApi() {
    if Reachability.isConnectedToNetwork() {
        showProgressOnView(self.view)
        let param1 : [String : String] = [
            "cat_id" :  UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.CATEGROY_ID) as? String ?? "",
            "scat_id" : UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.SUB_CATEGROY_ID) as? String ?? ""
        ]
        print(param1)
        ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: TRUST_BASE_URL + PROJECT_URL.GET_HOME_PAGE_API, successBlock: { (json) in
            print(json)
            hideAllProgressOnView(self.view)
            let success = json["success"].stringValue
            if success  == "true"  {
                self.homeOurCategoryResponseModelArray.removeAll()
                
                                    
                for i in 0..<json["data"]["category"].count {
                    let data = json["data"]["category"][i]
                    self.homeOurCategoryResponseModelArray.append(HomeOurCategoryResponseModel.init(name: data["name"].stringValue, image: data["image"].stringValue, id: data["id"].stringValue))
                }
                
                self.collectionView1.reloadData()
            }
            else {
                iToast.show(json["message"].stringValue)
            }
        }, errorBlock: { (NSError) in
            iToast.show(K.kUnexpectedErrorAlertString)
            hideAllProgressOnView(self.view)
        })
    }
    else{
        iToast.show("Please Check internet connection".localized)
    }
}

}

