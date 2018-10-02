//
//  Grouping.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/07.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct UserGrouping: Codable {
    public var _id: Int?
    public var groupId: Int?
    public var group: Group?
    public var userId: Int?
    public var user: PrunedUser?
    
    public init(_id: Int?, groupId: Int?, group: Group?, userId: Int?, user: PrunedUser) {
        self._id = _id
        self.groupId = groupId
        self.group = group
        self.userId = userId
        self.user = user
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case groupId
        case group
        case userId
        case user
    }
}

