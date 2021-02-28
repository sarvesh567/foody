//
//  ViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import UIKit

extension ViewController{
    
    func langChanged(stringLang: String)  {
        foddyLabel.text =  "Welcome to Hareef".localizableString(localisedString: stringLang)
    }
    
    
    
    func setLanguageApi(stringLang : String) {
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String:String] = [
                "id": "25",
                "language" : stringLang
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: TRUST_BASE_URL + PROJECT_URL.SET_DEFAULT_LANGUAGE_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let success = json["success"].stringValue
                if success  == "true"  {
                    if stringLang == "en" {
                        
                        UserDefaults.standard.setValue("en", forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE)
                        self.langChanged(stringLang: "en")
                        
                    }else{
                        
                    self.langChanged(stringLang: "ar")
                        UserDefaults.standard.setValue("ar", forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE)
                        
                    }
                    }
                    else if stringLang == "ar" {
                        
                        
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



class ViewController: UIViewController {
    @IBOutlet weak var foddyLabel: UILabel!
    @IBOutlet weak var segmenteController: UISegmentedControl!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        setLanguageApi(stringLang : UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as! String)
    }

    @IBAction func segmentButtonPressed(_ sender: Any) {
        
        
        
        
        
        if segmenteController.selectedSegmentIndex == 0{ //en
            
            setLanguageApi(stringLang: "en")
            //langChanged(stringLang: "en")
            
        }else{
            
            //langChanged(stringLang: "ar")
            setLanguageApi(stringLang: "ar")
            
            
            
        }
    }
    
    
    
}

extension String {
    
    func localizableString(localisedString: String) -> String{
        let path = Bundle.main.path(forResource: localisedString, ofType: "lproj")!
        let bundle = Bundle(path: path)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        
    }
    
    
}
