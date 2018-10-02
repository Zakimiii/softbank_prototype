//
//  ChatShowTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ChatShowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = 5
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    func setData(_ user: PrunedUser) {
        titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        nameLabel.text = user.nickname ?? ""
        detailLabel.text = ["宜しくおねがいします", "この前はどうもありがとうございました！", "また飲みにでも行きましょう！", "また参加してください！", "何かわかったら連絡お願いします！"][Int(arc4random()) % 5]
    }
}
