//
//  SingleProfileCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class SingleProfileCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = profileImage.frame.width / 2
            profileImage.layer.borderWidth = 0
            profileImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var follewButton: FollowButton! 
    @IBOutlet weak var boarderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func setData() {
        
    }
}
