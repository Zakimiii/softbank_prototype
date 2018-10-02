//
//  ContentFielding.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct ContentFielding: Codable {
    public var _id: Int?
    public var fieldId: Int?
    public var field: Field?
    public var contentId: Int?
    public var content: Content?
    
    public init(_id: Int?, fieldId: Int?, field: Field?, contentId: Int?, content: Content) {
        self._id = _id
        self.fieldId = fieldId
        self.field = field
        self.contentId = contentId
        self.content = content
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case fieldId
        case field
        case contentId
        case content
    }
}
