//
//  HomeTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func tapOwnerData(_ user: PrunedUser)
}

@objcMembers
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = 5
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var ownerImage: UIImageView! {
        didSet {
            ownerImage.layer.cornerRadius = 5
            ownerImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listener: UIView! {
        didSet {
            listener.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
        }
    }
    //weak var userData: PrunedUser!
    weak var delegate: HomeTableViewCellDelegate!
    
    func viewTapped(){
        self.delegate?.tapOwnerData(currentUser)
    }
    
    func setData(_ content: Content) {
        self.titleLabel.text = content.title ?? ""
        var str = ""
        self.fieldLabel.text = ""
        _ = prototypeContentFielding.filter { $0.content! == content }.compactMap {
            str += "#\(($0.field!.title ?? "")) "
        }
        _ = str.components(separatedBy: " ").unique.compactMap {
            self.fieldLabel.text! += $0
        }
        self.nameLabel.text = content.user?.nickname ?? ""
        self.titleImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        self.ownerImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
    }
}


