//
//  ServerClass.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct ERNetworkManagerResponse {    /// The server's response to the URL request
    public let responseDict: NSDictionary?
    /// The error encountered while executing or validating the request.
    public let message: String?
    /// Status of the request.
    public let success: Bool?
    var _metrics: AnyObject?
    init(response: NSDictionary?, status: Bool?,error: String?) {
        self.message = error
        self.responseDict = response
        self.success = status
    }
}


class ServerClass: NSObject {
    var arrRes = [[String:AnyObject]]()
    class var sharedInstance:ServerClass {
        struct Singleton {
            static let instance = ServerClass()
        }
        return Singleton.instance
    }
    

    private static var Manager: Alamofire.SessionManager = {
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            TRUST_BASE_URL: .disableEvaluation
        ]
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()
    
    //MARK:- GET Method
    func getRequestWithUrlParameters(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        
        headerField = ["Content-Type":"application/json" ]
        ServerClass.Manager.request(path, method: .get, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    
    //MARK:- GET Method with Localization
    func getRequestWithUrlParametersLocalization(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["Content-Type":"application/json", "X-localization" : lang]
        ServerClass.Manager.request(path, method: .get, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    
    
    //MARK:- POST Method
    func postRequestWithUrlParameters(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
       
        headerField = ["Content-Type":"application/json"]
        ServerClass.Manager.request(path, method: .post, parameters: sendJson, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    
    //MARK:- POST Method with Localization
    func postRequestWithUrlParametersLocalization(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["Content-Type":"application/json", "X-localization" : lang]
        ServerClass.Manager.request(path, method: .post, parameters: sendJson, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    
    //MARK:- PUT Method
    func putRequestWithUrlParameters(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        
        headerField = ["Content-Type":"application/json"]
        ServerClass.Manager.request(path, method: .put, parameters: sendJson, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    //MARK:- PUT Method with Localization
    func putRequestWithUrlParametersLocalization(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["Content-Type":"application/json", "X-localization" : lang]
        ServerClass.Manager.request(path, method: .put, parameters: sendJson, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    
    //MARK:- DELETE Method
    func deleteRequestWithUrlParameters(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
       
        headerField = ["Content-Type":"application/json"]
        ServerClass.Manager.request(path, method: .delete, parameters: sendJson, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    //MARK:- DELETE Method with Localization
    func deleteRequestWithUrlParametersLocalization(_ sendJson:[String:Any], path:String, successBlock:@escaping (_ response: JSON )->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["Content-Type":"application/json", "X-localization" : lang]
        ServerClass.Manager.request(path, method: .delete, parameters: sendJson, encoding: JSONEncoding.default, headers: headerField).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    successBlock(JSON(value ))
                }
            case .failure(let error):
                errorBlock(error as NSError)
            }
        }
    }
    
    //MARK:- Send Multipart Request To Server With Parameter with Localization
    func sendMultipartRequestToServerWithParameterLocalization(urlString:String, sendJson:[String:Any], successBlock:@escaping (_ response: JSON)->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["X-localization" : lang]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key,value) in sendJson {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
        }, to: urlString, method: .post, headers : headerField,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                print(upload.progress)
                upload.responseJSON {  response in
                    if let value = response.result.value
                    {
                        successBlock(JSON(value ))
                    }
                }
            case .failure( let error):
                errorBlock(error as NSError)
            }
        })
    }
    
    //MARK:- Send Multipart Request To Server With Parameter
    func sendMultipartRequestToServerWithParameter(urlString:String, sendJson:[String:Any], successBlock:@escaping (_ response: JSON)->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        
        headerField = ["Content-Type":"application/json"]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key,value) in sendJson {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
        }, to: urlString, method: .post, headers : headerField,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                print(upload.progress)
                upload.responseJSON {  response in
                    if let value = response.result.value
                    {
                        successBlock(JSON(value ))
                    }
                }
            case .failure( let error):
                errorBlock(error as NSError)
            }
        })
    }
    
    
    //MARK:- Send Multipart Request To Server with Localization
    func sendMultipartRequestToServerLocalization(urlString:String, sendJson:[String:Any], successBlock:@escaping (_ response: JSON)->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["X-localization" : lang]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key,value) in sendJson {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
        }, to: urlString, method: .post, headers : headerField,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                print(upload.progress)
                upload.responseJSON {  response in
                    if let value = response.result.value
                    {
                        successBlock(JSON(value ))
                    }
                }
            case .failure( let error):
                errorBlock(error as NSError)
            }
        })
    }
    
    //MARK:- Send Multipart Request To Server
    func sendMultipartRequestToServer(urlString:String, sendJson:[String:Any], successBlock:@escaping (_ response: JSON)->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        
        headerField = ["Content-Type":"application/json"]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key,value) in sendJson {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
        }, to: urlString, method: .post, headers : headerField,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                print(upload.progress)
                upload.responseJSON {  response in
                    if let value = response.result.value
                    {
                        successBlock(JSON(value ))
                    }
                }
            case .failure( let error):
                errorBlock(error as NSError)
            }
        })
    }
    
    //MARK:- Send Multipart Request To Server with token and  Localization
    func sendImageMultipartRequestToServerWithToken(urlString:String,sendJson:[String:Any], imageUrl:URL,imageKeyName:String, successBlock:@escaping (_ response: JSON)->Void , errorBlock: @escaping (_ error: NSError) -> Void ){
        var headerField : [String : String] = [:]
        let lang = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.APP_LANGUAGE) as? String ?? "en"
        headerField = ["X-localization" : lang]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key,value) in sendJson {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
            
            multipartFormData.append(imageUrl, withName: imageKeyName)
        }, to: urlString, method: .post, headers : headerField,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                print(upload.progress)
                upload.responseJSON {  response in
                    if let value = response.result.value
                    {
                        successBlock(JSON(value ))
                    }
                }
            case .failure( let error):
                errorBlock(error as NSError)
            }
        })
    }
    
    
    
    
    
    
    
    
}
