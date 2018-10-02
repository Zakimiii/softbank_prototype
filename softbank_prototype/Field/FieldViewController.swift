//
//  FieldViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/08.
//  Copyright © 2018年 Apple. All rights reserved.
//

import TabPageViewController

protocol FieldViewControllerProtocol: class {
    var currentSection: FieldSection { get set }
    var childTableView: UITableView? { get }
    var parentController: FieldViewController { get set }
    var contentHeight: CGFloat { get }
    func reloadData()
    func resetHeaderView(height: CGFloat)
    func resetFooterView()
}

extension FieldViewControllerProtocol {
    var maxVisibleHeight: CGFloat {
        var safeAreaBottom: CGFloat = 0
        if #available(iOS 11.0, *) {
            safeAreaBottom = parentController.containerView.safeAreaInsets.bottom
        }
        return parentController.containerView.frame.height - 40 - safeAreaBottom
    }
    
    func resetHeaderView(height: CGFloat) {
        if let oldHeight = childTableView?.tableHeaderView?.frame.height, oldHeight == height {
            return
        }
        childTableView?.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height + 40))
    }
    
    func reloadData() {
        childTableView?.reloadData()
        resetFooterView()
    }
    
    func resetFooterView() {
        if contentHeight < maxVisibleHeight {
            childTableView?.tableFooterView = UIView(frame:
                CGRect(x: 0,
                       y: 0,
                       width: UIScreen.main.bounds.width,
                       height: maxVisibleHeight - contentHeight))
        }
    }
    
//    func resetContentOffsetY() {
//        var maxContentOffsetY = parentController.topView.frame.height
//        if maxVisibleHeight < contentHeight {
//            maxContentOffsetY += contentHeight - maxVisibleHeight
//        }
//        
//        if maxContentOffsetY < -parentController.topViewTopConstraint.constant {
//            childTableView?.contentOffset.y = maxContentOffsetY
//            parentController.topViewTopConstraint.constant = -maxContentOffsetY
//        } else {
//            childTableView?.contentOffset.y = -parentController.topViewTopConstraint.constant
//        }
//    }
//    
//    func scrollTop() {
//        let maxContentOffsetY = parentController.topView.frame.height
//        
//        if maxContentOffsetY < -parentController.topViewTopConstraint.constant {
//            childTableView?.contentOffset.y = maxContentOffsetY
//            parentController.topViewTopConstraint.constant = -maxContentOffsetY
//        } else {
//            childTableView?.contentOffset.y = -parentController.topViewTopConstraint.constant
//        }
//    }
}

@objcMembers
class FieldViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var fields: [Field] = prototypeFieldForContent //Prototype
    private var children: [FieldViewControllerProtocol] = []
    private var pageViewController: TabPageViewController!
    private var isMoveTopView = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPageViewController()
        DispatchQueue.main.async {
            self.children.forEach { $0.reloadData() }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNaviBar()
    }

    private func setupNaviBar(){
            let button = UIButton(type: UIButtonType.custom)
            button.layer.backgroundColor = mainColor.cgColor
            button.layer.cornerRadius = 8.0
            button.setTitle("  完了  ", for: .normal)
            button.setTitle("  完了  ", for: .highlighted)
            button.titleLabel?.font = UIFont(name: hiragonoW6, size: 16)
            button.setTitleColor(UIColor.white, for: .normal)
            button.addTarget(self, action: #selector(self.tappedCompletedFn), for: .touchUpInside)
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = CGSize(width: 2, height: 2)
            button.layer.shadowRadius = 5
            let completeButton: UIBarButtonItem = UIBarButtonItem(customView: button)
            self.navigationItem.setRightBarButtonItems([completeButton], animated: true)
            self.navigationController?.navigationBar.tintColor = mainColor
//        guard let navigationController = self.navigationController,
//            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
//                fatalError("This navigationBar is not correct")
//        }
//        navigationBar.delegating = self
//        navigationBar.searchBar.delegate = self
//        navigationBar.menuView.delegate = self
//        navigationBar.chatButton.addTarget(self, action: #selector(self.tapChat), for: .touchUpInside)
    }
    
    func tappedCompletedFn(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension FieldViewController: TabPageViewControllerDelegate {
    func tabPageViewController(_ viewController: TabPageViewController, updateCurrentIndex index: Int) {
        children.forEach { $0.childTableView?.isScrollEnabled = true }
    }
    
    private func setupPageViewController() {
        pageViewController = TabPageViewController()
        pageViewController.tabPageDelegate = self
        pageViewController.isInfinity = false
        for index in 0...1 {
            let tableView = FieldTableViewController(nibName: R.nib.fieldTableViewController.name, bundle: nil)
//            _ = prototypeContentFielding.filter { $0.fieldId! == index.element._id! }.compactMap { tableView.contents.append($0.content!) }
//            tableView.parentController = self
//            self.children.append(tableView)
            tableView.currentSection = FieldSection(rawValue: index)!
            pageViewController.tabItems.append((tableView, FieldSection(rawValue: index)?.string ?? ""))
        }
        pageViewController.option.currentBarColor = mainColor
        pageViewController.option.currentTextColor = mainColor
        pageViewController.option.defaultTextColor = UIColor.darkGray
        pageViewController.option.tabWidth = UIScreen.main.bounds.width / 2
        addChildViewController(pageViewController)
        containerView.addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        pageViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        pageViewController.didMove(toParentViewController: self)
        //self.containerView.bringSubview(toFront: self.actionView)
        self.pageViewController.tabBarTopConstraint?.constant = 0
    }
    
    
    
    //    func refreshTabs() {
    //        guard self.isStaffLoaded && self.isSalonLoaded else {
    //            // Only reload once for efficiency
    //            return
    //        }
    //        children.forEach { $0.reloadData() }
    //    }
    
}

//extension HomeViewController: HomeNavigationBarDelegate {
//    func tappedSearchBar() {
//        _ = self.searchBar.becomeFirstResponder()
//        self.children.forEach {
//            $0.childTableView?.setContentOffset(scrollView.contentOffset, animated: false)
//            ($0.childTableView?.contentOffset = CGPoint(x: 0, y: -Int(($0.childTableView?.contentInset.top)!)))! }
//    }
//}
