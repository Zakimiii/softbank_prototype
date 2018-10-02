//
//  UserFieldings.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct UserFielding: Codable {
    public var _id: Int?
    public var fieldId: Int?
    public var field: Field?
    public var userId: Int?
    public var user: PrunedUser?
    
    public init(_id: Int?, fieldId: Int?, field: Field?, userId: Int?, user: PrunedUser) {
        self._id = _id
        self.fieldId = fieldId
        self.field = field
        self.userId = userId
        self.user = user
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case fieldId
        case field
        case userId
        case user
    }
}

