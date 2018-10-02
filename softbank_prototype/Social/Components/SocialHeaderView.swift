//
//  SocialHeaderView.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/03.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class SocialHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    
    class func getRect() -> CGRect {
        let width = UIScreen.main.bounds.width
        let height = CGFloat(44)
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    func setData() {
        
    }
}
