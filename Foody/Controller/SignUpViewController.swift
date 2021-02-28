//
//  SignUpViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textMobile: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    
    
    @IBOutlet weak var signUpLbl : UILabel!
    @IBOutlet weak var firstNameLbl : UILabel!
    @IBOutlet weak var lastNameLbl : UILabel!
    @IBOutlet weak var emailLbl : UILabel!
    @IBOutlet weak var mobileNumberLbl : UILabel!
    @IBOutlet weak var passwordLbl : UILabel!
    @IBOutlet weak var acceptTermsAndConditionLbl : UILabel!
    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var alreadyHaveAnAccountSignInLbl : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpLbl.text = "Sign up".localized
        firstNameLbl.text = "First Name".localized
        lastNameLbl.text = "Last Name".localized
        emailLbl.text = "Email".localized
        mobileNumberLbl.text = "Mobile Number".localized
        passwordLbl.text = "Password".localized
        signUpBtn.setTitle("Sign up".localized, for: .normal)
        

        
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        let viewController = UIStoryboard.loginViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func changeLanguageButtonPressed(_ sender: Any) {
        
        let modalViewController = ChangeLanguageViewController()
        modalViewController.modalPresentationStyle = .overFullScreen // .overCurrentContext
        modalViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(modalViewController, animated: false)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        if (textFirstName.text?.isEmpty)! {
            showInvalidInputAlert("First Name".localized)
        }
        else if (textLastName.text?.isEmpty)! {
            showInvalidInputAlert("Last Name".localized)
        }
        else if !(ValidationManager.validateEmail(email: textEmail.text!)) {
            showInvalidInputAlert("Email".localized)
        }
        else if (textMobile.text?.isEmpty)! {
            showInvalidInputAlert("Mobile Number".localized)
        }
            //        else if !(ValidationManager.validatePhone(no: mobileTextField.text!)) {
            //            showInvalidInputAlert("Mobile Number")
            //        }
        else if (textMobile.text?.isEmpty)! {
            showInvalidInputAlert("Mobile Number".localized)
        }
        else if ValidationManager.validatePassword(password: textPassword.text!) == 0 {
            showPasswordLengthAlert()
        }
        else if ValidationManager.validatePassword(password: textPassword.text!) == 1 {
            showPasswordWhiteSpaceAlert()
        }
        else if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1:[String:String] = ["f_name": self.textFirstName.text!,
                                          "l_name": self.textLastName.text!,
                                          "email": self.textEmail.text!,
                                          "password": self.textPassword.text!,
                                          "mobile" : self.textMobile.text!,
                                          "platform" : "iOS"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServerLocalization(urlString: TRUST_BASE_URL +  PROJECT_URL.REGISTER_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let success = json["success"].stringValue
                if success  == "true" {
                    
                    
                    let viewController = UIStoryboard.otpViewController()
                    viewController.emailStr = self.textEmail.text!
                    self.present(viewController, animated: true, completion: nil)

                }
                else{
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
    


