//
//  TabViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import RxSwift


private enum TabIndex: Int {
    //case article = 0
    case log = 0
    case social = 1
    case group = 2
    //case person = 4
    
//    var allCases: [TabIndex] {
//        return [.article, .log, .social, .group, .person]
//    }
    
    var image: UIImage {
        switch self {
//        case .article:
//            return (UIImage(named: R.image.article.name)?.withRenderingMode(.alwaysTemplate).resizedImage(newSize: CGSize(width: 25, height: 25)))!
        case .log:
            return (UIImage(named: R.image.tweet.name)?.withRenderingMode(.alwaysTemplate).resizedImage(newSize: CGSize(width: 25, height: 25)))!
        case .social:
            return (UIImage(named: R.image.enterpriceIcon.name)?.withRenderingMode(.alwaysTemplate).resizedImage(newSize: CGSize(width: 25, height: 25)))!
        case .group:
            return (UIImage(named: R.image.groupUser.name)?.withRenderingMode(.alwaysTemplate).resizedImage(newSize: CGSize(width: 25, height: 25)))!
//        case .person:
//            return (UIImage(named: R.image.persone.name)?.withRenderingMode(.alwaysTemplate).resizedImage(newSize: CGSize(width: 25, height: 25)))!
        }
    }
    
    var tabbarItem: UITabBarItem {
        switch self {
//        case .article:
//            return UITabBarItem(title: tabBarText1,
//                                           image: self.image,
//                                           tag: self.rawValue)
        case .log:
            return UITabBarItem(title: tabBarText2,
                                image: self.image,
                                tag: self.rawValue)
        case .social:
            return UITabBarItem(title: tabBarText3,
                                image: self.image,
                                tag: self.rawValue)
        case .group:
            return UITabBarItem(title: tabBarText4,
                                image: self.image,
                                tag: self.rawValue)
//        case .person:
//            return UITabBarItem(title: tabBarText5,
//                                image: self.image,
//                                tag: self.rawValue)
        }
    }
}

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().barTintColor = .white
        //self.delegate = self
        self.tabBar.tintColor = mainColor
        setupTabItem()
        self.customizableViewControllers = nil
    }
    
    private func setupTabItem() {
        guard let viewControllers = self.viewControllers else {
            fatalError("couldn't set up TabViewController")
        }
        for viewController in viewControllers.enumerated() {
            viewController.element.tabBarItem = TabIndex(rawValue: viewController.offset)?.tabbarItem
            viewController.element.tabBarItem.selectedImage = TabIndex(rawValue: viewController.offset)?.image
        }
    }
}
