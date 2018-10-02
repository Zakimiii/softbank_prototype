//
//  SocialHeaderCollectionViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/04.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class SocialHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = 5
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var boarderView: UIView!
    
    class func getSize() -> CGSize {
        let width = UIScreen.main.bounds.width - (20 * 2)
        let height = width - 80
        return CGSize(width: width, height: height)
    }
    
    func setData(_ log: Log) {
        self.titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        self.titleLabel.text = log.title ?? ""
        var str = ""
        self.fieldLabel.text = ""
        _ = prototypeLogFielding.filter { $0.log! == log }.compactMap {
            str += "#\(($0.field!.title ?? "")) "
        }
        _ = str.components(separatedBy: " ").unique.compactMap {
            self.fieldLabel.text! += $0
        }
    }
}
