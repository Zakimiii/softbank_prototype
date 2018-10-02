//
//  LogShowTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol LogShowTableViewDelegate: class {
    func tapOwnerData(_ user: PrunedUser)
}

@objcMembers
class LogShowTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = 5
            profileImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var followButton: FollowButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var favoriteView: FavoriteView!
    @IBOutlet weak var badView: BadView!
    @IBOutlet weak var goodView: GoodView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var listener: UIView! {
        didSet {
            listener.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapUser)))
        }
    }
    @IBOutlet weak var kindLabel: UILabel! {
        didSet {
            kindLabel.layer.cornerRadius = 3
            kindLabel.clipsToBounds = true
        }
    }
    
    var cellUser: PrunedUser!
    weak var delegate: LogShowTableViewDelegate!
    func setData(_ log: Log) {
        let lineSpaceStyle = NSMutableParagraphStyle()
        lineSpaceStyle.lineSpacing = 7.0
        let lineSpaceAttr = [NSAttributedStringKey.paragraphStyle: lineSpaceStyle]
        detailLabel.attributedText = NSMutableAttributedString(string: log.detail ?? "", attributes: lineSpaceAttr)
        profileImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        titleLabel.text = log.title ?? ""
        self.cellUser = log.user
        kindLabel.text = " \(LogSection(rawValue: log.role ?? 3)!.string) "
        kindLabel.backgroundColor = kindColor[log.role ?? 3]
    }
    func tapUser() {
        self.delegate?.tapOwnerData(cellUser)
    }
}
