//
//  UIViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/30.
//  Copyright © 2018年 Apple. All rights reserved.
//


import UIKit

extension UIViewController {
    enum Tags: Int {
        case indicator = 9999
    }
}

extension UIViewController {
    func isModal() -> Bool {
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.first != self {
                return false
            }
        }
        
        // Because I've segued many layers deep, this doesn't work
        //        if self.presentingViewController != nil {
        //            return true
        //        }
        
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
            return true
        }
        
        // Because I've segued many layers deep, this doesn't work
        //        if self.tabBarController?.presentingViewController is UITabBarController {
        //            return true
        //        }
        
        return false
    }
}

//extension UIViewController {
//    func dismissTabBarController() {
//        var viewController: UIViewController? = self
//        while viewController as? TabViewController == nil {
//            guard let presentingViewController = viewController?.presentingViewController else {
//                break
//            }
//            viewController = presentingViewController
//        }
//        (viewController as? TabViewController)?.updateMyPageTabIcon()
//        viewController?.dismiss(animated: true, completion: nil)
//    }
//}

extension UIViewController {
    func showIndicator() {
        if self.view.viewWithTag(Tags.indicator.rawValue) != nil {
            return
        }
        
        let bounds = self.view.bounds
        let view = UIView(frame: bounds)
        view.tag = Tags.indicator.rawValue
        view.backgroundColor = .clear
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.color = .black
        indicator.center = view.center
        indicator.startAnimating()
        
        view.addSubview(indicator)
        self.view.addSubview(view)
    }
    
    func hideIndicator() {
        guard let view = self.view.viewWithTag(Tags.indicator.rawValue) else {
            return
        }
        view.removeFromSuperview()
    }
}
