//
//  Info.swift
//  GoldenCoin
//
//  Created by Star on 7/13/17.
//  Copyright © 2017 Star. All rights reserved.
//

import UIKit

/*************************************************/
/*                   App Customize               */
/*************************************************/

struct Env {
    private static let production : Bool = {
        #if DEBUG
        print("DEBUG")
        return false
        #else
        print("PRODUCTION")
        return true
        #endif
    }()
    
    static func isProduction () -> Bool {
        return self.production
        //return true
    }
}

var VERSION_MODE = Env.isProduction() // true- release mode, false- debug mode

/** Keywords */
let SUPPORT_PHONE = "254720515026"
let SUPPORT_EMAIL = "support@chamafinance.com"

/** App Theme */
// base color
let CLEAR_COLOR = UIColor.clear
let WHITE_COLOR = UIColor(rgb: 0xFFFFFF, a: 1.0)
let GRAY_COLOR = UIColor(rgb: 0x888888, a: 1.0)
let BLACK_COLOR = UIColor(rgb: 0x000000, a: 1.0)
let GREEN_COLOR = UIColor(rgb: 0x48BE10, a: 1.0)
let BROWN_COLOR = UIColor(rgb: 0x664828, a: 1.0)
let DARK_COLOR = UIColor(rgb: 0x555555, a: 1.0)
let DARK_GRAY_COLOR = UIColor(rgb: 0x434343, a: 1.0)

let PRIMARY_COLOR = UIColor(rgb: 0x44adf1, a: 1.0)
let PRIMARY_COLOR_DARK = UIColor(rgb: 0x44adf1, a: 1.0)
let LIGHT_ORANGE_COLOR = UIColor(rgb: 0xee8133, a: 1.0)
let LIGHT_GREEN_COLOR = UIColor(rgb: 0xa7cd3a, a: 1.0)
let LIGHT_YELLOW_COLOR = UIColor(rgb: 0xf9cb33, a: 1.0)



// App Color
let ACTIVE_COLOR = UIColor(rgb: 0x44adf1, a: 1.0)
let DIALOG_BACK_COLOR = WHITE_COLOR

/** Api Urls */
let SERVER_URL_LOCAL = "http://10.0.0.19/Qonect/"
let SERVER_URL_SERVER = "http://104.248.7.157/Qonect/"
var SERVER_URL = SERVER_URL_SERVER
var API_BASE_URL = SERVER_URL + "api/"

/** App Store Link */
let APP_LINK = "https://itunes.apple.com/us/app/qonect/id1441316747?ls=1&mt=8"

/** Key */
// Stripe
let MODE_SANDBOX = "sandbox"
let MODE_LIVE = "live"

let PROFILE_PHOTO_WIDTH: CGFloat = 200

let APPS_COUNTRIES = [
    "Kenya",
    "United States of America",
    "United Kingdom",
    "Germany",
    "United Arab Emirates",
]


