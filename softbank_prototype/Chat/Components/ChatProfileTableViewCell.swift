//
//  ChatProfileTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/05.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ChatProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var topBoarderView: UIView!
    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = 5
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    func setData(_ user: PrunedUser) {
        titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        nameLabel.text = user.nickname ?? ""
    }
    
}
