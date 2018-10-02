//
//  ContentListing.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/07.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct ContentListing: Codable {
    public var _id: Int?
    public var listId: Int?
    public var list: List?
    public var contentId: Int?
    public var content: Content?
    
    public init(_id: Int?, listId: Int?, list: List?, contentId: Int?, content: Content) {
        self._id = _id
        self.listId = listId
        self.list = list
        self.contentId = contentId
        self.content = content
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case listId
        case list
        case contentId
        case content
    }
}
