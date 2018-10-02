//
//  ContentShowFooterCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/01.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol ContentShowFooterCellDelegate: class {
    func tapOwnerData(_ user: PrunedUser)
}
@objcMembers
class ContentShowFooterCell: UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = 5
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var favoriteView: FavoriteView!
    @IBOutlet weak var badView: BadView!
    @IBOutlet weak var goodView: GoodView!
    @IBOutlet weak var topBoarderView: UIView! {
        didSet {
            topBoarderView.isHidden = true
        }
    }
    @IBOutlet weak var bottomBoarderView: UIView!
    @IBOutlet weak var listener: UIView! {
        didSet {
            listener.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapUser)))
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    var cellUser: PrunedUser!
    weak var delegate: ContentShowFooterCellDelegate!
    func setData(_ user: PrunedUser){
        self.titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        self.nameLabel.text = user.nickname ?? ""
        self.cellUser = user
    }
    func tapUser() {
        self.delegate?.tapOwnerData(cellUser)
    }
}
