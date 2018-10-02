//
//  CommentIndexTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol CommentIndexTableViewDelegate :class{
    func tapOwnerData(_ user: PrunedUser)
}
@objcMembers
class CommentIndexTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = 5
            userImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var badView: BadView!
    @IBOutlet weak var goodView: GoodView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var listener: UIView! {
        didSet {
            listener.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapUser)))
        }
    }
    @IBOutlet weak var followButton: FollowButton!
    weak var delegate: CommentIndexTableViewDelegate!
    var cellUser: PrunedUser!
    func setData(contentComment: ContentComment? = nil , logComment: LogComment? = nil){
        if let commentForContent = contentComment {
            let lineSpaceStyle = NSMutableParagraphStyle()
            lineSpaceStyle.lineSpacing = 7.0
            let lineSpaceAttr = [NSAttributedStringKey.paragraphStyle: lineSpaceStyle]
            commentLabel.attributedText = NSMutableAttributedString(string: commentForContent.detail ?? "", attributes: lineSpaceAttr)
            nameLabel.text = commentForContent.user?.nickname ?? ""
            userImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
            self.cellUser = commentForContent.user
        }
        if let commentForLog = logComment {
            let lineSpaceStyle = NSMutableParagraphStyle()
            lineSpaceStyle.lineSpacing = 7.0
            let lineSpaceAttr = [NSAttributedStringKey.paragraphStyle: lineSpaceStyle]
            commentLabel.attributedText = NSMutableAttributedString(string: commentForLog.detail ?? "", attributes: lineSpaceAttr)
            nameLabel.text = commentForLog.user?.nickname ?? ""
            userImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
            self.cellUser = commentForLog.user
        }
    }
    
    func tapUser() {
        self.delegate?.tapOwnerData(cellUser)
    }
}
