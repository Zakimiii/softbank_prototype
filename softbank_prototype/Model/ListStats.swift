//
//  ListStats.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/07.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct ListStats: Codable {
    
    public var _id: Int?
    public var favoriteCount: Int?
    public var goodCount: Int?
    public var badCount: Int?
    
    public init(_id: Int?, favoriteCount: Int?, goodCount: Int?, badCount: Int?) {
        self._id = _id
        self.favoriteCount = favoriteCount
        self.goodCount = goodCount
        self.badCount = badCount
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case favoriteCount
        case goodCount
        case badCount
    }
    
}
