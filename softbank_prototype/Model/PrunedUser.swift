//
//  PrunedUser.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct PrunedUser: Codable {
    public var _id: Int?
    public var uuid: String?
    public var role: String?
    public var nickname: String?
    public var registrationConfirmed: Bool?
    public var stats: UserStats?
    public var image: String?
    public var backgroundImage: String?
    public var permissions: [String]?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var version: Double?
    
    public init(_id: Int?, uuid: String?, role: String?, nickname: String?, registrationConfirmed: Bool?, stats: UserStats?, image: String?, backgroundImage: String?, permissions: [String]?, createdAt: Date?, updatedAt: Date?, version: Double?) {
        self._id = _id
        self.uuid = uuid
        self.role = role
        self.nickname = nickname
        self.registrationConfirmed = registrationConfirmed
        self.stats = stats
        self.image = image
        self.backgroundImage = backgroundImage
        self.permissions = permissions
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.version = version
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case uuid
        case role
        case nickname
        case registrationConfirmed
        case stats
        case image
        case backgroundImage
        case permissions
        case createdAt
        case updatedAt
        case version
    }
}
