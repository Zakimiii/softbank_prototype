//
//  ContentHeaderCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ContentHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "2018 softbank summer intern"
        }
    }
    @IBOutlet weak var boarderView: UIView!
    
    func setData( content: Content? = nil, log: Log? = nil ){
        if let unwrappedContent = content {
            titleLabel.text = unwrappedContent.title ?? ""
        }
        if let unwrappedLog = log {
            titleLabel.text = unwrappedLog.title ?? ""
        }
    }
    
}
