//
//  CarouselCollectionCell.swift
//  salomee-ios
//
//  Created by noriki.iwamatsu on 2018/05/27.
//  Copyright © 2018年 Personize Inc. All rights reserved.
//

import FSPagerView
import UIKit

class CarouselCollectionCell: UICollectionViewCell {

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

    private var imageNames: [String] = [] {
        didSet {
            pageControl.numberOfPages = self.imageNames.count
        }
    }
    private var bannerUrls: [String] = []

    class func getSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width / 2)
    }

    func setData(imageNames: [String], bannerUrls: [String]) {
        self.imageNames = imageNames
        self.bannerUrls = bannerUrls
        self.pagerView.reloadData()
    }
}

extension CarouselCollectionCell: FSPagerViewDataSource, FSPagerViewDelegate {
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
        return imageNames.count
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
}
