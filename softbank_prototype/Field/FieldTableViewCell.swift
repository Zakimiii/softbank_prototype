//
//  FieldTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/08.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    func setData(_ string: String) {
        titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        titleLabel.text = string
    }
    
}
