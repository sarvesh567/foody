//
//  ChangeLanguageViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class ChangeLanguageViewController: UIViewController {
    
    
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var englishBtn: UIButton!
    @IBOutlet weak var arabicBtn: UIButton!
    @IBOutlet weak var alertView: UIView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        
        
            
        
        
           
        
       
        
        if UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "" == "en" {
            
            self.setLanguageApi(languageStr: "en")
            englishBtn.backgroundColor = UIColor.green
            arabicBtn.backgroundColor = UIColor.gray
        }
        else {
            
            self.setLanguageApi(languageStr: "ar")
            arabicBtn.backgroundColor = UIColor.green
            englishBtn.backgroundColor = UIColor.gray
        }
        
        languageLbl.text = "Please select your language".localized
}
    
    @IBAction func englishButtonPressed(_ sender: Any) {
//        if englishBtn.backgroundColor == UIColor.green {
//            englishBtn.backgroundColor == UIColor.green
//            arabicBtn.backgroundColor == UIColor.gray
//            //self.dismiss(animated: false, completion: nil)
//            languageLbl.text = "Please select your language".localized
//        }
        englishBtn.backgroundColor = UIColor.green
        arabicBtn.backgroundColor = UIColor.gray
        languageLbl.text = "Please select your language".localized
        
    }
    

    @IBAction func arabicButtonPressed(_ sender: Any) {
        
        
//        if arabicBtn.backgroundColor == UIColor.gray {
//            arabicBtn.backgroundColor == UIColor.green
//            englishBtn.backgroundColor == UIColor.gray
//            //self.dismiss(animated: false, completion: nil)
//            languageLbl.text = "Please select your language".localized
//
//        }
        
        arabicBtn.backgroundColor = UIColor.green
        englishBtn.backgroundColor = UIColor.gray
        languageLbl.text = "Please select your language".localized
        
        
    }
    
    
    func setLanguageApi(languageStr : String) {
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String:String] = [
                "id": "25",
                "language" : "ar"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: TRUST_BASE_URL + PROJECT_URL.SET_DEFAULT_LANGUAGE_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let success = json["success"].stringValue
                if success  == "true"  {
                    if languageStr == "en" {
                        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
                        UserDefaults.standard.setValue("en", forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE)
                        
                        
                        }
                    }
                    else if languageStr == "ar" {
                        LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
                        UserDefaults.standard.setValue("ar", forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE)
                        
                    }else{
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
