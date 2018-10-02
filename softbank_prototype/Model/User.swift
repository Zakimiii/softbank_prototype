//
//  User.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation



public struct User: Codable {
    
    public var _id: Int?
    public var uuid: String?
    public var email: String?
    public var role: String?
    public var firstNameZenkaku: String?
    public var firstNameKana: String?
    public var lastNameZenkaku: String?
    public var lastNameKana: String?
    public var fullName: String?
    public var phoneNumber: String?
    public var nickname: String?
    public var password: String?
    public var registrationConfirmed: Bool?
    public var facebookId: String?
    public var twitterId: String?
    public var instagramId: String?
    public var stats: UserStats?
    public var image: String?
    public var backgroundImage: String?
    public var guestId: Int?
    public var permissions: [String]?
    public var deleted: Bool?
    public var deletedAt: Date?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var version: Double?
    
    public init(_id: Int?, uuid: String?, email: String?, role: String?, firstNameZenkaku: String?, firstNameKana: String?, lastNameZenkaku: String?, lastNameKana: String?, fullName: String?, phoneNumber: String?, nickname: String?, password: String?, registrationConfirmed: Bool?, facebookId: String?, twitterId: String?, instagramId: String?, stats: UserStats?, image: String?, backgroundImage: String?, guestId: Int?, permissions: [String]?, deleted: Bool?, deletedAt: Date?, createdAt: Date?, updatedAt: Date?, version: Double?) {
        self._id = _id
        self.uuid = uuid
        self.email = email
        self.role = role
        self.firstNameZenkaku = firstNameZenkaku
        self.firstNameKana = firstNameKana
        self.lastNameZenkaku = lastNameZenkaku
        self.lastNameKana = lastNameKana
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.nickname = nickname
        self.password = password
        self.registrationConfirmed = registrationConfirmed
        self.facebookId = facebookId
        self.twitterId = twitterId
        self.instagramId = instagramId
        self.stats = stats
        self.image = image
        self.backgroundImage = backgroundImage
        self.guestId = guestId
        self.permissions = permissions
        self.deleted = deleted
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.version = version
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case uuid
        case email
        case role
        case firstNameZenkaku
        case firstNameKana
        case lastNameZenkaku
        case lastNameKana
        case fullName
        case phoneNumber
        case nickname
        case password
        case registrationConfirmed
        case facebookId
        case twitterId
        case instagramId
        case stats
        case image
        case backgroundImage
        case guestId
        case permissions
        case deleted
        case deletedAt
        case createdAt
        case updatedAt
        case version
    }
    
    
}
