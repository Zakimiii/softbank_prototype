//
//  ProfileIndexCollectionViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/03.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ProfileIndexCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var baseView: UIView!
    class func getSize() -> CGSize {
        let width = 180
        let height = 300
        return CGSize(width: width, height: height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.borderColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        baseView.layer.borderWidth = 1.0
    }
}
