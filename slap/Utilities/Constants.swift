//
//  Constants.swift
//  slap
//
//  Created by Araz Sinjary on 5/23/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import Foundation

//typealias is meaing renaming type expresion like blow.
//typealias araz = string
//let name: araz = "araz"
typealias CompletionHandler = (_ Success: Bool) -> ()

//colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3254901961, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//notification constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataCanged")

//URL Constants
let BASE_URL =   "https://chattychatchating.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN =  "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"

//this for segues to be constant.
let TO_LOGIN = "toLogin"
let TO_CREATEACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//user defaults.
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]


let BEARER_HEADER =  [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]

