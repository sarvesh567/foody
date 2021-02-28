//
//  CategoryViewModel.swift
//  Foody
//
//  Created by Sarvesh Patel on 14/02/21.
//

import Foundation

extension CategoryViewController{
    
    func getCategoryApi() {
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            ServerClass.sharedInstance.getRequestWithUrlParameters([:], path: TRUST_BASE_URL + PROJECT_URL.GET_CATEGORY_API, successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let success = json["success"].stringValue
                
                if success  == "true"  {
                    self.categoryResponseModelArray.removeAll()
                    
                    for i in 0..<json["data"].count {
                        self.categoryResponseModelArray.append(CategoryResponseModel.init(id: json["data"][i]["id"].stringValue, name: json["data"][i]["name"].stringValue, icon: json["data"][i]["icon"].stringValue, describe: json["data"][i]["describe"].stringValue, status: json["data"][i]["status"].stringValue, image: json["data"][i]["image"].stringValue))
                    }
                    print(self.categoryResponseModelArray)
                    self.tableView1.reloadData()
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
    
    

