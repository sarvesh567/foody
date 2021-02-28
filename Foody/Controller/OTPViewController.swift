//
//  OTPViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    var emailStr:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = emailStr
        otpTextField1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case otpTextField1:
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                otpTextField3.becomeFirstResponder()
            case otpTextField3:
                otpTextField4.becomeFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case otpTextField1:
                otpTextField1.becomeFirstResponder()
            case otpTextField2:
                otpTextField1.becomeFirstResponder()
            case otpTextField3:
                otpTextField2.becomeFirstResponder()
            case otpTextField4:
                otpTextField3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    //MARK:- Done button action
    @IBAction func doneButtonPressed(_ sender: Any) {
        if !(otpTextField1.text != "" && otpTextField2.text != "" && otpTextField3.text != "" && otpTextField4.text != "") {
                    UIAlertController.showInfoAlertWithTitle("Alert", message: "Please enter valid otp", buttonTitle: "Okay")
                }
                else if Reachability.isConnectedToNetwork() {
                    showProgressOnView(self.view)
                    let param1:[String:String] = [
                        "email": emailStr,
                        "otp": "\(otpTextField1.text!)\(otpTextField2.text!)\(otpTextField3.text!)\(otpTextField4.text!)",
                    ]
                    print(param1)
                    ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: TRUST_BASE_URL + PROJECT_URL.OTP_CONFIRMATION_API, sendJson: param1, successBlock: { (json) in
                        print(json)
                        hideAllProgressOnView(self.view)
                        let success = json["success"].stringValue
                        if success  == "true"  {
                            iToast.show(json["message"].stringValue)
                            let viewController = UIStoryboard.loginViewController()
                                self.present(viewController, animated: true, completion: nil)
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
