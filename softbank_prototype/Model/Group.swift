//
//  Group.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/07.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct Group: Codable {
    public var _id: Int?
    public var title: String?
    
    public init(_id: Int?, title: String?) {
        self._id = _id
        self.title = title
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case title
    }
}
