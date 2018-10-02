//
//  CarouselView.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import FSPagerView

class CarouselView: UIView {

    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.setStrokeColor(nil, for: .normal)
            self.pageControl.setStrokeColor(nil, for: .selected)
            self.pageControl.setFillColor(UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 0.25), for: .normal)
            self.pageControl.setFillColor(UIColorFromRGB(0x7A9EFF), for: .selected)
            self.pageControl.setImage(nil, for: .normal)
            self.pageControl.setImage(nil, for: .selected)
            self.pageControl.setPath(nil, for: .normal)
            self.pageControl.setPath(nil, for: .selected)
            
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.currentPage = 0
            self.pageControl.contentInsets = UIEdgeInsets(top: -15, left: 10, bottom: 0, right: 10)
            
            self.pageControl.subviews.forEach {
                $0.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.isInfinite = true
            self.pagerView.automaticSlidingInterval = 3
            self.pagerView.layer.shadowRadius = 0
            self.pagerView.delegate = self
            self.pagerView.dataSource = self
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(pageClicked))
            self.pagerView.isUserInteractionEnabled = true
            self.pagerView.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet weak var gradientView: UIView! {
        didSet {
            setupGradientLayer()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(R.nib.carouselView.name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.backgroundColor = .clear
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private var imageNames: [String] = [] {
        didSet {
            pageControl.numberOfPages = 3 //self.imageNames.count
        }
    }
    private var bannerUrls: [String] = []
    
    class func getSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width / 2)
    }
    
    func setData(imageNames: [String], bannerUrls: [String]) {
        self.imageNames = ["", "", ""]
        self.bannerUrls = ["", "", ""]
        self.pagerView.reloadData()
    }
}

extension CarouselView: FSPagerViewDataSource, FSPagerViewDelegate {
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3//imageNames.count
    }
    
    // When banner is clicked, open up the salomee home page
    @objc func pageClicked() {
        //        guard self.pagerView.currentIndex < bannerUrls.count else {
        //            return
        //        }
        //
        //        // Header page clicked:
        //        print("page clicked", self.pagerView.currentIndex)
        //        if let url = URL(string: bannerUrls[self.pagerView.currentIndex]) {
        //            UIApplication.shared.open(url, options: [:])
        //        }
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        let width = self.frame.width + 100
        let height = width
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        gradientLayer.colors = [UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.47).cgColor,
                                UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 0.00).cgColor,
                                UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.00).cgColor,
                                UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.50).cgColor]
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
