//
//  PlusAction.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol PlusActionDelegate: class {
    func tappedButton(_ button: UIButton)
}

@objcMembers
class PlusAction: UIView {
    weak var delegate: PlusActionDelegate!
    @IBOutlet weak var actionButton: UIButton! {
        didSet {
            actionButton.setImage(R.image.plusIcon()!.withRenderingMode(.alwaysTemplate), for: .normal)
            actionButton.setImage(R.image.plusIcon()!.withRenderingMode(.alwaysTemplate), for: .highlighted)
            actionButton.tintColor = UIColor.white
            actionButton.addTarget(self, action: #selector(self.tappedButtonFn(_:)), for: .touchUpInside)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(R.nib.plusAction.name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.backgroundColor = .clear
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        view.layer.cornerRadius = self.bounds.size.height / 2
        view.layer.masksToBounds = true
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red: 0.60, green: 0.62, blue: 0.96, alpha: 1.00).cgColor,
                           UIColor(red: 0.30, green: 0.62, blue: 0.96, alpha: 1.00).cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0.11)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = self.bounds.size.height / 2
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func tappedButtonFn(_ button: UIButton) {
        self.delegate?.tappedButton(button)
    }
}
