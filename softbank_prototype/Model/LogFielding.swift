//
//  LogFielding.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct LogFielding: Codable {
    public var _id: Int?
    public var fieldId: Int?
    public var field: Field?
    public var logId: Int?
    public var log: Log?
    
    public init(_id: Int?, fieldId: Int?, field: Field?, logId: Int?, log: Log) {
        self._id = _id
        self.fieldId = fieldId
        self.field = field
        self.logId = logId
        self.log = log
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case fieldId
        case field
        case logId
        case log
    }
}
