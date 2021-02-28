//
//  Alert.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//


import UIKit
import MBProgressHUD
import SwiftyJSON
import AVFoundation
import SDWebImage


extension String {
    var localized: String { LocalizationSystem.sharedInstance.localizedStringForKey(key: self, comment: "")}
}





//MARK:- Alert Methods
func showPasswordLengthAlert() {
    UIAlertController.showInfoAlertWithTitle("Error".localized, message: "The Password should consist at least 6 characters.".localized, buttonTitle: "Okay".localized)
}

func showPasswordWhiteSpaceAlert() {
    UIAlertController.showInfoAlertWithTitle("Error".localized, message: K.kPasswordWhiteSpaceAlertString.localized, buttonTitle: "Okay".localized)
}

func showPasswordUnEqualAlert() {
    UIAlertController.showInfoAlertWithTitle("Error".localized, message: K.kUnequalPasswordsAlertString.localized, buttonTitle: "Okay".localized)
}

func showPasswordEqualAlert() {
    UIAlertController.showInfoAlertWithTitle("Error".localized, message: K.kEqualPasswordsAlertString.localized, buttonTitle: "Okay".localized)
}

func showInvalidInputAlert(_ fieldName : String) {
    UIAlertController.showInfoAlertWithTitle("Error".localized, message: String(format: "Please enter a valid ".localized + "%@.",fieldName), buttonTitle: "Okay".localized)
}

//MARK:- MBProgressHUD Methods
func showProgressOnView(_ view:UIView) {
    let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text =  "Loading..".localized
}

func hideProgressOnView(_ view:UIView) {
    MBProgressHUD.hide(for: view, animated: true)
}

func hideAllProgressOnView(_ view:UIView) {
    MBProgressHUD.hide(for: view, animated: true)
}

//MARK:- Clear SDWebImage Cache
func clearImageCache() {
    SDImageCache.shared.clearDisk()
    SDImageCache.shared.clearMemory()
}

//MARK:- iToast
class iToast: NSObject {
    
    class func show(_ toastMessage: String?) {
        
        OperationQueue.main.addOperation({
            let keyWindow: UIWindow? = UIApplication.shared.keyWindow
            let toastView = UILabel()
        
            toastView.frame = CGRect(x: 20, y: keyWindow!.bounds.size.height - 50, width: keyWindow!.bounds.size.width - 40, height: 40.0)
            toastView.font = UIFont.systemFont(ofSize: 15)
            toastView.text = toastMessage
            toastView.textAlignment = NSTextAlignment.center
            toastView.textColor = UIColor.white
            toastView.layer.cornerRadius = 20
            toastView.layer.masksToBounds = true
            toastView.backgroundColor = UIColor.black
            toastView.alpha = 1.0
            keyWindow?.addSubview(toastView)
            UIView.animate(withDuration: 10.0, delay: 0.0, options: .curveEaseOut, animations: {
                toastView.alpha = 0.0
            }) { finished in
                toastView.removeFromSuperview()
            }
        })
    }
}
