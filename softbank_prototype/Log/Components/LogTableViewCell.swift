//
//  LogTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var boaderView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel! {
        didSet {
            kindLabel.layer.cornerRadius = 3
            kindLabel.clipsToBounds = true
        }
    }
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var goodLabel: UILabel!
    
    func setData(_ log: Log){
        titleLabel.text = log.title ?? ""
        self.fieldLabel.text = ""
        var str = ""
        _ = prototypeLogFielding.filter { $0.log! == log }.compactMap {
            str += "#\(($0.field!.title ?? "")) "
        }
        _ = str.components(separatedBy: " ").unique.compactMap {
            self.fieldLabel.text! += $0
        }
        kindLabel.text = " \(LogSection(rawValue: log.role ?? 3)!.string) "
        kindLabel.backgroundColor = kindColor[log.role ?? 3]
        commentLabel.text = "コメント: 3件"
        goodLabel.text = "いいね: 1000"
    }
}
