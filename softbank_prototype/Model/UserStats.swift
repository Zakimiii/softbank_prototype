//
//  UserStats.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct UserStats: Codable {
    
    public var _id: Int?
    public var followCount: Int?
    public var followedCount: Int?
    
    public init(_id: Int?, followCount: Int?, followedCount: Int?) {
        self._id = _id
        self.followCount = followCount
        self.followedCount = followedCount
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case followCount
        case followedCount
    }
    
}

