//
//  ChatGroupTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/05.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ChatGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = titleImage.frame.width / 2
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var boarderView: UIView!
    
    func setData(_ group: Group) {
        titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        nameLabel.text = group.title ?? ""
    }
    
}
