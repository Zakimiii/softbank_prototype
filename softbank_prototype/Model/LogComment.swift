//
//  Comment.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct LogComment: Codable {
    public var _id: Int?
    public var detail: String?
    //public var assets: ProductAssets?
    public var userId: Int?
    public var user: PrunedUser?
    public var logId: Int?
    public var log: Log?
    public var createdBy: Int?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deleted: Bool?
    public var deletedAt: Date?
    
    public init(_id: Int?, detail: String?, userId: Int?, user: PrunedUser?, logId: Int?, log: Log?, createdBy: Int?, createdAt: Date?, updatedAt: Date?, deleted: Bool?, deletedAt: Date?) {
        self._id = _id
        self.detail = detail
        //self.assets = assets
        self.user = user
        self.userId = userId
        self.logId = logId
        self.log = log
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deleted = deleted
        self.deletedAt = deletedAt
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case detail
        case user
        case userId
        case logId
        case log
        case createdBy
        case createdAt
        case updatedAt
        case deleted
        case deletedAt
    }
}
