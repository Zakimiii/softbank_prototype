//
//  TableHeaderView.swift
//  salomee-ios
//
//  Created by noriki.iwamatsu on 2018/07/03.
//  Copyright © 2018年 Personize Inc. All rights reserved.
//

import UIKit

class TableHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topBoaderView: UIView!
    @IBOutlet weak var buttomBoaderView: UIView!
    
    func setFontSize(_ size: CGFloat) {
        self.titleLabel?.font = UIFont(name: hiragonoW3, size: size)
    }
}
