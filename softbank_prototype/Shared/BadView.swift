//
//  BadView.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/01.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class BadView: UIView {
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.setImage(R.image.bad()!.withRenderingMode(.alwaysTemplate), for: UIControlState.normal.union(.highlighted))
            button.setImage(R.image.bad()!.withRenderingMode(.alwaysTemplate), for: UIControlState.selected.union(.highlighted))
        }
    }
    
    @IBInspectable
    var badText: String? = nil {
        didSet {
            button?.setTitle(badText, for: .normal)
            button?.setTitle(badText, for: UIControlState.normal.union(.highlighted))
        }
    }
    @IBInspectable
    var badedText: String? = nil {
        didSet {
            button?.setTitle(badedText, for: .selected)
            button?.setTitle(badedText, for: UIControlState.selected.union(.highlighted))
        }
    }
    var isBaded: Bool {
        get {
            return button?.isSelected ?? false
        }
        set {
            UIView.animate(withDuration: 0, animations: {[unowned self] in
                self.button?.isSelected = newValue
                }, completion: { [unowned self] _ in
                    newValue ? self.setFilter() : self.clearFilter()
            })
        }
    }
    
    //    private var gradient: CAGradientLayer? {
    //        didSet {
    //            gradient?.frame = self.bounds
    //            gradient?.colors = [UIColor(red: 0.17, green: 0.73, blue: 0.68, alpha: 1.00).cgColor,
    //                                UIColor(red: 0.17, green: 0.64, blue: 0.68, alpha: 1.00).cgColor]
    //            gradient?.locations = [0, 1]
    //            gradient?.startPoint = CGPoint(x: 0, y: 0.11)
    //            gradient?.endPoint = CGPoint(x: 1, y: 1)
    //            gradient?.cornerRadius = self.frame.height / 2
    //        }
    //    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(R.nib.badView.name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        isBaded = false
    }
    
    private func setFilter() {
        self.backgroundColor = .clear
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor(red: 0.54, green: 0.62, blue: 1.00, alpha: 0.50).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        //        gradient?.removeFromSuperlayer()
        //        gradient = CAGradientLayer()
        //        self.layer.insertSublayer(gradient!, at: 0)
        
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        layer.borderWidth = 0
        self.button.setTitleColor(mainColor, for: .normal)
        self.button.tintColor = .white
    }
    
    private func clearFilter() {
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        self.layer.shadowOpacity = 0
        self.layer.shadowRadius = 0
        //gradient?.removeFromSuperlayer()
        
        let color = UIColor(red: 0.45, green: 0.62, blue: 0.96, alpha: 1.00)
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        layer.borderWidth = 0
        self.button.setTitleColor(color, for: .normal)
        self.button.tintColor = .darkGray
    }
}
