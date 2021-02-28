//
//  LoginViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var rememberMeImageView: UIImageView!
    
    @IBOutlet weak var rememberMeImage: UIImageView!
    var emailStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(emailStr)
        
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
//        let modalViewController = ChangeLanguageViewController()
//        modalViewController.modalPresentationStyle = .overFullScreen // .overCurrentContext
//        modalViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        present(modalViewController, animated: true, completion: nil)
        
        
        let viewController = UIStoryboard.signUpViewController()
        present(viewController, animated: true, completion: nil)
    }
    

    
    @IBAction func rememberMeButtonPressed(_ sender: Any) {
        
        if rememberMeImageView.image?.pngData() == UIImage(named: "remember_selected")!.pngData() {
            rememberMeImageView.image = #imageLiteral(resourceName: "remember")
        }
        else {
            rememberMeImageView.image = #imageLiteral(resourceName: "remember_selected")
        }
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        if !(ValidationManager.validateEmail(email: emailTextField.text!)) {
            showInvalidInputAlert("Email")
        }
        else if ValidationManager.validatePassword(password: passwordTextField.text!) == 0 {
            showPasswordLengthAlert()
        }
        else if ValidationManager.validatePassword(password: passwordTextField.text!) == 1 {
            showPasswordWhiteSpaceAlert()
        }
        else if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1:[String:String] = [
                "email": self.emailTextField.text!,
                "password": self.passwordTextField.text!,
                "fcm_token" : "xxxxxxxxxx"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServerLocalization(urlString: TRUST_BASE_URL + PROJECT_URL.LOGIN_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let data = json["data"]
                print(data["email"].stringValue)
                let success = json["success"].stringValue
                if success  == "true"  {
                    print("Success!!!!")
                    UserDefaults.standard.setValue(json["data"]["token"].stringValue, forKey: USER_DEFAULTS_KEYS.LOGIN_TOKEN)
                    UserDefaults.standard.setValue(json["data"]["id"].stringValue, forKey: USER_DEFAULTS_KEYS.USER_ID)
                    UserDefaults.standard.set(json["data"]["f_name"].stringValue, forKey: USER_DEFAULTS_KEYS.USER_FIRST_NAME)
                    UserDefaults.standard.set(json["data"]["l_name"].stringValue, forKey: USER_DEFAULTS_KEYS.USER_LAST_NAME)
                    UserDefaults.standard.set(json["data"]["email"].stringValue, forKey: USER_DEFAULTS_KEYS.USER_EMAIL)
                    UserDefaults.standard.set(json["data"]["customer_profile"].stringValue.trimURLString(), forKey: USER_DEFAULTS_KEYS.USER_IMAGE)
                    UserDefaults.standard.set(json["data"]["phone"].stringValue, forKey: USER_DEFAULTS_KEYS.USER_PHONE)
                    UserDefaults.standard.set(json["data"]["notify_status"].stringValue, forKey: USER_DEFAULTS_KEYS.NOTIFY_STATUS)
                    UserDefaults.standard.setValue(true, forKey: USER_DEFAULTS_KEYS.IS_LOGIN)
                    
                    if self.rememberMeImage.image? .pngData() == UIImage(named: "remember_selected")!.pngData() {
                        UserDefaults.standard.set(true, forKey: USER_DEFAULTS_KEYS.IS_REMEMBER_ME)
                    }
                    else {
                        UserDefaults.standard.set(false, forKey: USER_DEFAULTS_KEYS.IS_REMEMBER_ME)
                    }
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
            iToast.show("Please Check internet connection")
        }
    }
}
        
        
        
   
