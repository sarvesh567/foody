//
//  Extension.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import Foundation
import UIKit






extension UIStoryboard {
    class func mainStoryBoard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    class func loginViewController() -> LoginViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    class func signUpViewController() -> SignUpViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
    }
    class func otpViewController() -> OTPViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
    }

    class func subCategoryViewController() -> SubCategoryViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
    }
    class func categoryViewController() -> CategoryViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
    }
    class func homeViewController() -> HomeViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
    class func customTabBar() -> CustomTabBar {
        return mainStoryBoard().instantiateViewController(withIdentifier: "CustomTabBar") as! CustomTabBar
    }
//    class func myFavouriteViewController() -> MyFavouriteViewController {
//           return mainStoryBoard().instantiateViewController(withIdentifier: "MyFavouriteViewController") as! MyFavouriteViewController
//       }
//    class func detailsViewController() -> DetailsViewController {
//         return mainStoryBoard().instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
//     }
//     class func reviewsViewController() -> ReviewsViewController {
//            return mainStoryBoard().instantiateViewController(withIdentifier: "ReviewsViewController") as! ReviewsViewController
//        }
//    class func profileViewController() -> ProfileViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//    }
//    class func settingViewController() -> SettingViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
//    }
//    class func aboutUsViewController() -> AboutUsViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
//    }
//    class func changePasswordViewController() -> ChangePasswordViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
//    }
//    class func contactUsViewController() -> ContactUsViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
//    }
//    class func notificationListViewController() -> NotificationListViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "NotificationListViewController") as! NotificationListViewController
//    }
//    class func myOrderListViewController() -> MyOrderListViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "MyOrderListViewController") as! MyOrderListViewController
//    }
//    class func orderDetailsViewController() -> OrderDetailsViewController {
//           return mainStoryBoard().instantiateViewController(withIdentifier: "OrderDetailsViewController") as! OrderDetailsViewController
//       }
//    class func cartListViewController() -> CartListViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "CartListViewController") as! CartListViewController
//    }
//    class func checkoutViewController() -> CheckoutViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
//    }
//    class func selectDeliveryOptionViewController() -> SelectDeliveryOptionViewController {
//           return mainStoryBoard().instantiateViewController(withIdentifier: "SelectDeliveryOptionViewController") as! SelectDeliveryOptionViewController
//       }
//    class func addAddressViewController() -> AddAddressViewController {
//           return mainStoryBoard().instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
//       }
//    class func oTPViewController() -> OTPViewController {
//             return mainStoryBoard().instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
//         }
}


extension UIAlertController {
    class func showInfoAlertWithTitle(_ title: String?, message: String?, buttonTitle: String, viewController: UIViewController? = nil){
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction.init(title: buttonTitle, style: .default, handler: { (okayAction) in
                if viewController != nil {
                    viewController?.dismiss(animated: true, completion: nil)
                } else {
                    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(okayAction)
            if viewController != nil {
                viewController?.present(alertController, animated: true, completion: nil)
            } else {
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            }
        })
    }

}


extension UIImage {
    func fixOrientation() -> UIImage? {
        // No-op if the orientation is already correct
        if imageOrientation == .up {
            return self
        }
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = .identity
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi/2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -.pi/2)
        case .up, .upMirrored:
            break
        }
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        }
        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: (cgImage?.bitsPerComponent)!, bytesPerRow: 0, space: (cgImage?.colorSpace)!, bitmapInfo: (cgImage?.bitmapInfo)!.rawValue)
        ctx?.concatenate(transform)
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            // Grr...
            ctx?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            ctx?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        // And now we just create a new UIImage from the drawing context
        let cgimg = ctx?.makeImage()
        let img = UIImage(cgImage: cgimg!)
        return img
    }
    //MARK:- set tab bar item background color
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0 , width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


extension UIView {
    func setShadow(shadowSize:CGFloat, radius: CGFloat) {
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: 0,
                                                   width: self.bounds.width + shadowSize,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor  //custom
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.06
        self.layer.shadowRadius = radius
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func setShadow(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, radius: CGFloat) {
        let shadowPath = UIBezierPath(rect: CGRect(x: x,
                                                   y: y,
                                                   width: width,
                                                   height: height))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor  //custom
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = radius
        self.layer.shadowPath = shadowPath.cgPath
    }
}


extension UITableView {
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
}

extension UICollectionView {
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
}


extension String {
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F:   // Variation Selectors
                return true
            default:
                continue
            }
        }
        return false
    }
    
    func containsOnlyNumbers(_ string : String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = (string as NSString).components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    init(htmlEncodedString: String) {
        self.init()
        guard let encodedData = htmlEncodedString.data(using: .utf8) else {
            self = htmlEncodedString
            return
        }
        
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.documentType.rawValue): NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.characterEncoding.rawValue): String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            self = attributedString.string
        }
        catch {
            self = htmlEncodedString
        }
    }
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}



//MARK:-document directory realted method
public func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

public func saveImageDocumentDirectory(usedImage:UIImage, nameStr:String) {
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(nameStr)
    let imageData = usedImage.jpegData(compressionQuality: 0.7)
    fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
}
