//
//  Constants.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import Foundation

var currentUserId: Int? = 1
var currentUser: PrunedUser = user1 //本当はUser
var currentGuestId: Int? // Set by Util on initialization
var currentGuest: User?

let hiragonoW3 = "HiraginoSans-W3"
let hiragonoW6 = "HiraginoSans-W6"

let mainColor = UIColor(red: 0.45, green: 0.62, blue: 0.96, alpha: 1.00)//UIColor(red: 0.17, green: 0.68, blue: 0.68, alpha: 1.00)
let baseColor = UIColor.white
let lineColor = UIColor.black

let kindColor = [UIColor.red, UIColor.blue, UIColor.green, mainColor]

func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

enum SocialSection: Int {
    case header
    case ranking
    case list
    case group
    case user
    case count
    
    var string: String {
        switch self {
        case .header: return socialSectionString1
        case .ranking: return socialSectionString2
        case .list: return socialSectionString3
        case .group: return socialSectionString4
        case .user: return socialSectionString5
        case .count: return ""
        }
    }
}

enum LogSection: Int {
    case team
    case tweet
    case question
    case count
    
    var string: String {
        switch self {
        case .team: return logSectionString1
        case .tweet: return logSectionString2
        case .question: return logSectionString3
        case .count: return ""
        }
    }
}

enum FieldSection: Int {
    case category
    case field
    case count
    
    var string: String {
        switch self {
        case .category: return "分野を選択"
        case .field: return "タブの並び替え削除"
        case .count: return ""
        }
    }
}
