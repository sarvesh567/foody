//
//  ValidationManager.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import UIKit

class ValidationManager: NSObject {
    
    //MARK:- Validation for password
    class func validatePassword(password:String) -> Int {
        let characterSet = NSCharacterSet.whitespaces
        let range = password.rangeOfCharacter(from: characterSet)
        if range == nil {
            if password.count >= K.kPasswordMinimumLength{
                return 2
            }
            else {
                return 0
            }
        }
        else {
            return 1
        }
    }
    
    //MARK:- Validation for email
    class func validateEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //MARK:- Validation for mobile
    class func validatePhone(no:String) -> Bool {
        let mobileRegEx = NSString(format:"[0-9]{%d}",K.kPhoneNumberMaximumLength) as String
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", mobileRegEx)
        return phoneTest.evaluate(with: no)
    }
    
    //MARK:- Validation for fullName
    class func validateUserFullName(name:String) -> Bool {
        let trimmedName = name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedName.count < 2 {
            return false
        }
        else {
            let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ. ")
            if trimmedName.rangeOfCharacter(from: characterset.inverted) != nil {
                return false
            }
            else {
                return true
            }
        }
    }
    
    //MARK:- Validation for emptyField
    class func validateFieldForEmpty(text:String) -> Bool {
        let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedText.count == 0 {
            return false
        }
        else {
            return true
        }
    }
    
    //MARK:- Validation for ZIPCODE
    class func validateZipCode(zipCode:String) -> Bool {  //For US only
        let zipCodeRegEx = "^\\d{5}([\\-]?\\d{4})?$"
        let zipCodeTest = NSPredicate(format:"SELF MATCHES %@", zipCodeRegEx)
        return zipCodeTest.evaluate(with: zipCode)
    }
    
   
}


extension String {
    func trimURLString() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}
