//
//  Constant.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import Foundation
import Frames

struct K {
    static let kPasswordMinimumLength = 6
    static let kPasswordMaximumLength = 15
    static let kUserFullNameMaximumLength = 56
    static let kPhoneNumberMaximumLength = 12
    static let kMessageMinimumLength = 25
    static let kMessageMaximumLength = 250
    static let kPasswordWhiteSpaceAlertString = "The Password should not contain any whitespaces." as String
    static let kUnequalPasswordsAlertString = "Both Passwords do not match." as String
    static let kEqualPasswordsAlertString = "Old & New Password are same." as String
    static let kUnexpectedErrorAlertString = "An unexpected error has occurred. Please try again." as String
    
}

//MARK:- TRUST_BASE_URL
let TRUST_BASE_URL =  "https://team.hareef.net/api/"
struct PROJECT_URL {
    /****** COMMON API ******/
    
    
    static let REGISTER_API = "signup"
    static let OTP_CONFIRMATION_API = "otpconfirmmation"
    static let RESEND_OTP_API = "resend"
    
    static let LOGIN_API = "login"
    static let FORGOT_PASSWORD_API = "forgot_password"
    static let CHANGE_PASSWORD_API = "change_password"
    static let UPDATE_FCM_API = "update_fcm"
    static let SOCIAL_LOGIN_API = "social_login"
    
    static let GET_CATEGORY_API = "get_category"
    static let GET_SUB_CATEGORY_API = "get_subcategory"
    static let GET_HOME_PAGE_API = "get_home_page"
    static let GET_VENDOR_DETAILS_API = "get_vendor_detail"
    static let ADD_TO_CART_API = "add_cart"
    static let GET_CART_API = "get_cart"
    static let UPDATE_CART_API = "update_cart"
    static let REMOVE_CART_API = "empty_cart"
    static let APPLY_COUPON_API = "apply_coupon"
    static let PLACE_ORDER_API = "place_order"
    static let GET_RATING_REVIEW_API = "review_list"
    static let GET_PROFILE_API = "getprofile"
    static let UPDATE_PROFILE_API = "updateprofile"
    static let ADD_ADDRESS_API = "add_adderss"
    static let GET_ADDRESS_API = "manage_adderss"
    static let GET_NOTIFICATION_LIST_API = "notification"
    static let GET_ORDER_LIST_API = "get_order"
    static let GET_ORDER_DETAILS_API = "get_order_detail"
    static let GET_WISHLIST_API = "get_favourite"
    static let ADD_WISHLIST_API = "add_favourite"
    static let REMOVE_WISHLIST_API = "un_favourite"
    
    static let ORDER_RATE_API = "review_rating"
    static let DRIVER_RATE_API = "driver_rate"
    
    static let NOIFICATION_STATUS_API = "notification_on_off"
    static let SET_DEFAULT_LANGUAGE_API = "language"
    static let ABOUT_US_API = "aboutus"
    static let Privacy_Policy_API = "privacy"
    static let Term_And_Conditions_API = "term"
    static let CONTACT_US_API = "contactus"
    static let FAQ_API = "faqs"
    static let LOGOUT_API = "logout"
    
    static let BRAINTREE_TOKEN_API = "customertoken"
    static let BRAINTREE_PAYMENT_API = "customerpayment"
    
}

struct USER_DEFAULTS_KEYS {
    static let APP_LANGUAGE = "appLanguage"
    static let LOGIN_TOKEN = "loginToken"
    static let IS_LOGIN = "isLogin"
    static let USER_ID = "userID"
    static let USER_FIRST_NAME = "fName"
    static let USER_LAST_NAME = "lName"
    static let USER_EMAIL = "email"
    static let USER_IMAGE = "userImage"
    static let USER_PHONE = "userPhone"
    static let IS_REMEMBER_ME = "isRemember"
    static let FCM_KEY = "fcmKey"
    static let CATEGROY_ID = "categoryId"
    static let SUB_CATEGROY_ID = "subCategoryId"
    static let NOTIFY_STATUS = "notifyStatus"
}

typealias FetchProfileResponse = (Bool) -> Void

let IS_IPHONE_5 = UIScreen.main.bounds.width == 320
let IS_IPHONE_6 = UIScreen.main.bounds.width == 375
let IS_IPHONE_6P = UIScreen.main.bounds.width == 414
let IS_IPAD = UIScreen.main.bounds.width >= 768.0
let IS_IPAD_Mini = UIScreen.main.bounds.width == 768.0
let IS_IPAD_Pro = UIScreen.main.bounds.width == 834.0
let IS_IPAD_Pro12 = UIScreen.main.bounds.width == 1024.0

//MARK:- Fetch Device Height
func fetchDeviceHeight() -> CGFloat {
    if IS_IPHONE_5 {
        return 568
    } else if IS_IPHONE_6 {
        return 667
    } else if IS_IPHONE_6P {
        return 736
    } else if IS_IPAD_Mini {
        return 1024
    } else if IS_IPAD_Pro  {
        return 1112
    } else if IS_IPAD_Pro12  {
        return 1366
    }else {
        return 1366
    }
    
}
