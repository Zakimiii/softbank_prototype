//
//  Log.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct Log: Codable {
    public var _id: Int?
    public var title: String?
    public var image: String?
    public var detail: String?
    public var role: Int?
    //public var assets: ProductAssets?
    public var userId: Int?
    public var user: PrunedUser?
    public var createdBy: Int?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deleted: Bool?
    public var deletedAt: Date?
    
    public init(_id: Int?, title: String?, image: String?, detail: String?, role: Int?, userId: Int?, user: PrunedUser?, createdBy: Int?, createdAt: Date?, updatedAt: Date?, deleted: Bool?, deletedAt: Date?) {
        self._id = _id
        self.title = title
        self.image = image
        self.detail = detail
        self.role = role
        //self.assets = assets
        self.user = user
        self.userId = userId
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deleted = deleted
        self.deletedAt = deletedAt
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case title
        case image
        case detail
        case role
        case user
        case userId
        case createdBy
        case createdAt
        case updatedAt
        case deleted
        case deletedAt
    }
}
