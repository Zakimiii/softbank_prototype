//
//  ChatProfileHeaderView.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ChatProfileHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var titleImage: UIImageView! {
        didSet {
            titleImage.layer.cornerRadius = 5
            titleImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var topBoarderView: UIView!

}
