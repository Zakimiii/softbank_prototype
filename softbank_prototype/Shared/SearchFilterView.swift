//
//  SearchFilterView.swift
//  salomee-ios
//
//  Created by noriki.iwamatsu on 2018/06/06.
//  Copyright © 2018年 Personize Inc. All rights reserved.
//

import UIKit

protocol SearchFilterViewDelegate: class {
    func searchFilterViewTapped(_ View: SearchFilterView)
}

@IBDesignable
class SearchFilterView: UIView {
    @IBOutlet weak var button: UIButton!

    weak var delegate: SearchFilterViewDelegate?
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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    @IBAction func viewTapped(_ sender: Any) {
        self.delegate?.searchFilterViewTapped(self)
    }

    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed("SearchFilterView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true

        isSelected = false
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
        self.button.setTitleColor(.white, for: .normal)
        self.button.tintColor = .white
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
        self.button.setTitleColor(color, for: .normal)
        self.button.tintColor = color
    }
}
