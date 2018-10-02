//
//  BaseTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/01.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.setImage(R.image.left()!.withRenderingMode(.alwaysTemplate), for: .normal)
            button.setImage(R.image.left()!.withRenderingMode(.alwaysTemplate), for: .highlighted)
            button.tintColor = .darkGray
            button.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    func setData(){
        
    }
}
