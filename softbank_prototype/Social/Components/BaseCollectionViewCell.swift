//
//  BaseCollectionViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/03.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 5
            containerView.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var listView: UIVisualEffectView! {
        didSet {
            listView.isHidden = true
        }
    }
    @IBOutlet weak var groupView: UIVisualEffectView! {
        didSet {
            groupView.isHidden = true
        }
    }
    @IBOutlet weak var followButton: FollowButton!
    
    
    class func getSize() -> CGSize {
        let width = (UIScreen.main.bounds.width - (20 * 2)) / 2
        let height = (5 * 2) + (12 * 3) + width
        return CGSize(width: width, height: height)
    }
    
    func setData( user: PrunedUser? = nil, group: Group? = nil, list: List? = nil) {
        if let unwrappedUser = user {
            self.titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
            self.titleLabel.text = unwrappedUser.nickname ?? ""
            self.fieldLabel.text = "#サッカー #野球 #金融"
        }
        if let unwrappedList = list {
            self.titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
            self.titleLabel.text = unwrappedList.title ?? ""
            self.fieldLabel.text = "#サッカー #野球 #金融"
        }
        if let unwrappedGroup = group {
            self.titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
            self.titleLabel.text = unwrappedGroup.title ?? ""
            self.fieldLabel.text = "#サッカー #野球 #金融"
        }
    }
}
