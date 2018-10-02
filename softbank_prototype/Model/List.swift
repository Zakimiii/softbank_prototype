//
//  List.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/07.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

public struct List: Codable {
    public var _id: Int?
    public var title: String?
    public var stats: ListStats?
    
    public init(_id: Int?, title: String?, stats: ListStats) {
        self._id = _id
        self.title = title
        self.stats = stats
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case title
        case stats
    }
}
