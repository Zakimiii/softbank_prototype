//
//  Array.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func remove(value: Element) {
        if let i = self.index(of: value) {
            self.remove(at: i)
        }
    }
}

extension Array where Element: Equatable {
    var unique: [Element] {
        return reduce([Element]()) { $0.contains($1) ? $0 : $0 + [$1] }
    }
}

extension Content : Equatable {}

public func == (lhs: Content, rhs: Content) -> Bool {
    return lhs._id == rhs._id
}

extension Log : Equatable {}

public func == (lhs: Log, rhs: Log) -> Bool {
    return lhs._id == rhs._id
}
