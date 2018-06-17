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

//URL Constants
let BASE_URL =   "https://chattychatchating.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN =  "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

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

