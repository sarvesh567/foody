//
//  SubCategoryViewModel.swift
//  Foody
//
//  Created by Sarvesh Patel on 14/02/21.
//

import Foundation

extension SubCategoryViewController{
    
func getSubCategoryApi() {
    if Reachability.isConnectedToNetwork() {
        showProgressOnView(self.view)
        let param1 : [String : String] = ["cat_id" : catIdStr]
        
        ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: TRUST_BASE_URL + PROJECT_URL.GET_SUB_CATEGORY_API, successBlock: { (json) in
            print(json)
            hideAllProgressOnView(self.view)
            let success = json["success"].stringValue
            if success  == "true"  {
                for i in 0..<json["data"].count {
                    self.subCategoryResponseModelArray.append(SubCategoryResponseModel.init(id: json["data"][i]["id"].stringValue, name: json["data"][i]["name"].stringValue, cat_id: json["data"][i]["cat_id"].stringValue, image: json["data"][i]["image"].stringValue))
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
