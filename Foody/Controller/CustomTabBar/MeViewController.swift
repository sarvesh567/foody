//
//  MeViewController.swift
//  Foody
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class MeViewController: UIViewController {

    //MARK:- IBOutlet for imageView.
    @IBOutlet weak var profileImgView: UIImageView!
    //MARK:- IBOutlet for TextField.
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var mobileTextField: UITextField!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
    //MARK:- Action for edit button.
    @IBAction func profileEditBtnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Choose An Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //MARK:- Action for save button.
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        
        if (firstNameTextField.text?.isEmpty)! {
            showInvalidInputAlert("First Name")
        }
        else if (lastNameTextField.text?.isEmpty)! {
            showInvalidInputAlert("Last Name")
        }else if (mobileTextField.text?.isEmpty)! {
            showInvalidInputAlert("Mobile Number")
        }
        else if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let userIdStr = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.USER_ID) as? String ?? ""
        print(userIdStr)
            let param1:[String:String] = [
                "f_name": self.firstNameTextField.text!,
                "l_name": self.lastNameTextField.text!,
                "email": self.emailTextField.text!,
                "mobile" : self.mobileTextField.text!
            ]
            print(param1)
            saveImageDocumentDirectory(usedImage: profileImgView.image!, nameStr: "image.jpg")
            let userImageURL = URL(fileURLWithPath: (getDirectoryPath() as NSString).appendingPathComponent("image.jpg"))
            print(userImageURL)
            
            
            ServerClass.sharedInstance.sendImageMultipartRequestToServerWithToken(urlString: TRUST_BASE_URL + PROJECT_URL.UPDATE_PROFILE_API + "/\(userIdStr)", sendJson: param1, imageUrl: userImageURL, imageKeyName: "customer_profile", successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let success = json["success"].stringValue
                if success  == "true"  {
                    iToast.show(json["message"].stringValue)
//                    🥚
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
    



extension MeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            //            showPopUpWithTitle(viewController: self, title: "Your device have not camera".localized)
        }
    }
    
    func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            //            userImageView.contentMode = .scaleAspectFit
            profileImgView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
