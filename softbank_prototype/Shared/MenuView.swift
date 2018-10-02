//
//  MenuView.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol MenuViewDelegate: class {
    func tapMenuView(_ view: MenuView)
}

@objcMembers
class MenuView: UIView {
    @IBOutlet weak var centerView: UIView! {
        didSet {
            centerView.layer.cornerRadius = 1.5
            centerView.clipsToBounds = true
        }
    }
    @IBOutlet weak var bottomView: UIView! {
        didSet {
            bottomView.layer.cornerRadius = 1.5
            bottomView.clipsToBounds = true
        }
    }
    @IBOutlet weak var topView: UIView! {
        didSet {
            topView.layer.cornerRadius = 1.5
            topView.clipsToBounds = true
        }
    }
    weak var delegate: MenuViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(R.nib.menuView.name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.backgroundColor = .clear
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappMenuViewFn(_:))))
    }
    
    func tappMenuViewFn(_ view: MenuView) {
        self.delegate?.tapMenuView(self)
    }
    
    func toChangeClose() {
        UIView.animate(withDuration: 0.3, animations: {
            self.centerView.isHidden = true
            self.topView.center.y = self.centerView.center.y
            self.bottomView.center.y = self.centerView.center.y
            self.topView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * CGFloat.pi / 180))
            self.bottomView.transform = CGAffineTransform(rotationAngle: CGFloat(135 * CGFloat.pi / 180))
        })
    }
    
    func toChangeMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.centerView.isHidden = false
            self.topView.center.y = self.centerView.center.y - 6
            self.bottomView.center.y = self.centerView.center.y + 6
            self.topView.transform = CGAffineTransform(rotationAngle: CGFloat(0 * CGFloat.pi / 180))
            self.bottomView.transform = CGAffineTransform(rotationAngle: CGFloat(0 * CGFloat.pi / 180))
        })
    }
    
}
