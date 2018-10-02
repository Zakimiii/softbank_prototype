//
//  FilterHeader.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/01.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol SearchFilterHeaderDelegate: class {
    func searchFilterViewTapped(_ View: FilterHeader)
}
class FilterHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var boarderView: UIView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: SearchFilterHeaderDelegate?
    var isSelected: Bool = false {
        didSet {
            isSelected ? setFilter() : clearFilter()
        }
    }
    
    private var gradient: CAGradientLayer? {
        didSet {
            gradient?.frame = self.bounds
            gradient?.colors = [UIColor(red: 0.69, green: 0.62, blue: 1.00, alpha: 1.00).cgColor,
                                UIColor(red: 0.48, green: 0.62, blue: 1.00, alpha: 1.00).cgColor]
            gradient?.locations = [0, 1]
            gradient?.startPoint = CGPoint(x: 0, y: 0.11)
            gradient?.endPoint = CGPoint(x: 1, y: 1)
            gradient?.cornerRadius = self.frame.height / 2
        }
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        self.delegate?.searchFilterViewTapped(self)
    }
    
    private func setFilter() {
        self.backgroundColor = .clear
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor(red: 0.54, green: 0.62, blue: 1.00, alpha: 0.50).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        gradient?.removeFromSuperlayer()
        gradient = CAGradientLayer()
        self.layer.insertSublayer(gradient!, at: 0)
        
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        layer.borderWidth = 0
        self.filterButton.setTitleColor(.white, for: .normal)
        self.filterButton.tintColor = .white
    }
    
    private func clearFilter() {
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        self.layer.shadowOpacity = 0
        self.layer.shadowRadius = 0
        gradient?.removeFromSuperlayer()
        
        let color = UIColor(red: 0.45, green: 0.62, blue: 0.96, alpha: 1.00)
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1
        self.filterButton.setTitleColor(color, for: .normal)
        self.filterButton.tintColor = color
    }
    
    
}
