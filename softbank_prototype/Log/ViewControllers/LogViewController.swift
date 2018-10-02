//
//  LogViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import TabPageViewController
import PopupDialog

protocol LogViewControllerProtocol: class {
    var childTableView: UITableView? { get }
    var parentController: LogViewController { get set }
    var contentHeight: CGFloat { get }
    func reloadData()
    func resetHeaderView(height: CGFloat)
    func resetFooterView()
    func resetContentOffsetY()
    func scrollTop()
}

extension LogViewControllerProtocol {
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
    
    func resetContentOffsetY() {
        var maxContentOffsetY = parentController.topView.frame.height
        if maxVisibleHeight < contentHeight {
            maxContentOffsetY += contentHeight - maxVisibleHeight
        }
        
        if maxContentOffsetY < -parentController.topViewTopConstraint.constant {
            childTableView?.contentOffset.y = maxContentOffsetY
            parentController.topViewTopConstraint.constant = -maxContentOffsetY
        } else {
            childTableView?.contentOffset.y = -parentController.topViewTopConstraint.constant
        }
    }
    
    func scrollTop() {
        let maxContentOffsetY = parentController.topView.frame.height
        
        if maxContentOffsetY < -parentController.topViewTopConstraint.constant {
            childTableView?.contentOffset.y = maxContentOffsetY
            parentController.topViewTopConstraint.constant = -maxContentOffsetY
        } else {
            childTableView?.contentOffset.y = -parentController.topViewTopConstraint.constant
        }
    }
}

@objcMembers
class LogViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var searchContainerTop: NSLayoutConstraint!
    @IBOutlet weak var orientLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var orientLabel: UILabel! {
        didSet {
            orientLabel.text = "気軽に投稿しよう!"//logOrient[Int(arc4random() % 5)]
        }
    }
    @IBOutlet weak var searchContainerView: UIView! {
        didSet {
            searchContainerView.isHidden = true
        }
    }
    @IBOutlet weak var menuContainerView: UIView! {
        didSet {
            menuContainerView.isHidden = true
        }
    }
    @IBOutlet weak var menuContainerViewWidth: NSLayoutConstraint!
    @IBOutlet weak var actionView: PlusAction! {
        didSet {
            actionView.layer.shadowColor = UIColor.black.cgColor
            actionView.layer.shadowOpacity = 0.5
            actionView.layer.shadowOffset = CGSize(width: 5, height: 5)
            actionView.layer.shadowRadius = 10
            actionView.delegate = self
        }
    }
    @IBOutlet weak var topContainerView: UIView! {
        didSet {
            topContainerView.layer.shadowColor = UIColor.black.cgColor
            topContainerView.layer.shadowOpacity = 0.5
            topContainerView.layer.shadowOffset = CGSize(width: 5, height: 5)
            topContainerView.layer.shadowRadius = 5
            topContainerView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var searchFilterView: SearchFilterView!
    var menuAnimated = false
    var logs: [Log] = prototypeLog
    var fields: [Field] = prototypeFieldForLog
    private var children: [LogViewControllerProtocol] = []
    private var pageViewController: TabPageViewController!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewTopConstraint: NSLayoutConstraint!
    private var topViewHeight: CGFloat = 0
    private var isMoveTopView = true
    @IBOutlet weak var textField: PlaceHolderTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier: R.segue.logViewController.toField, sender: nil)
        self.setupPageViewController()
        DispatchQueue.main.async {
            self.children.forEach { $0.reloadData() }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNaviBar()
    }
    
    override func viewWillLayoutSubviews() {
        updateTopViewFrame()
    }
    
    private func setupNaviBar(){
        guard let navigationController = self.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        navigationBar.searchEnabled()
        navigationBar.delegating = self
        navigationBar.searchBar.delegate = self
        navigationBar.menuView.delegate = self
        navigationBar.chatButton.addTarget(self, action: #selector(self.tapChat), for: .touchUpInside)
    }
    
    private func updateTopViewFrame() {
        children.forEach {
            $0.resetHeaderView(height: self.topView.frame.height)
            $0.resetFooterView()
        }
        if topViewHeight != self.topView.frame.height {
            self.pageViewController.tabBarTopConstraint?.constant = self.topView.frame.maxY  - 20
            self.topViewHeight = self.topView.frame.height
        }
    }
    
    func tapChat(){
        self.view.endEditing(true)
    }
}
    
extension LogViewController: TabPageViewControllerDelegate {
    
    func tabPageViewController(_ viewController: TabPageViewController, updateCurrentIndex index: Int) {
        children.forEach { $0.childTableView?.isScrollEnabled = true }
    }
    
    private func setupPageViewController() {
        pageViewController = TabPageViewController()
        pageViewController.tabPageDelegate = self
        pageViewController.isInfinity = false
        for index in self.fields.enumerated() {
            let tableView = LogIndexTableViewController(nibName: R.nib.logIndexTableViewController.name, bundle: nil)
            _ = prototypeLogFielding.filter { $0.fieldId! == index.element._id! }.compactMap { tableView.logs.append($0.log!) }
            tableView.parentController = self
            self.children.append(tableView)
            pageViewController.tabItems.append((tableView, self.fields[index.offset].title ?? ""))
        }
        pageViewController.option.currentBarColor = mainColor
        pageViewController.option.currentTextColor = mainColor
        pageViewController.option.defaultTextColor = UIColor.darkGray
        pageViewController.option.tabWidth = UIScreen.main.bounds.width / 4
        addChildViewController(pageViewController)
        containerView.addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        pageViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        pageViewController.didMove(toParentViewController: self)
        self.containerView.bringSubview(toFront: self.actionView)
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

extension LogViewController: PlusActionDelegate {
    func tappedButton(_ button: UIButton) {
        self.performSegue(withIdentifier: R.segue.logViewController.toNewLog.identifier, sender: nil)
    }
}

extension LogViewController: SearchBarDelegate {
    func searchBar(_ searchBar: SearchBar, searched keyword: String?) {
    }
    
    func searchBar(_ searchBar: SearchBar, accessoryButtonTapped keyword: String?) -> Bool {
        searchBar.keyword = nil
        return true
    }
    
    func searchBarDidBeginEditing() {
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.isNavigationBarHidden = true
            self.orientLabelHeight.constant = 0
        })
        self.searchContainerView.fadeIn(type: .Normal, completed: nil)
        self.orientLabel.fadeOut(type: .Normal, completed: nil)
    }
    
    func searchBarDidEndEditing() {
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.isNavigationBarHidden = false
            self.orientLabelHeight.constant = 20
        })
        self.searchContainerView.fadeOut(type: .Normal, completed: nil)
        self.orientLabel.fadeIn(type: .Normal, completed: nil)
    }
}

extension LogViewController: MenuViewDelegate {
    func tapMenuView(_ view: MenuView) {
        if !self.menuAnimated {
            view.toChangeClose()
            UIView.animate(withDuration: 0.3, animations: {
                self.menuContainerViewWidth.constant = self.view.frame.width
            })
            self.menuContainerView.fadeIn(type: .Normal, completed: nil)
            self.menuAnimated = true
        } else {
            view.toChangeMenu()
            UIView.animate(withDuration: 0.3, animations: {
                self.menuContainerViewWidth.constant = 0
            })
            self.menuContainerView.fadeOut(type: .Normal, completed: nil)
            self.menuAnimated = false
        }
    }
}

extension LogViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if let vc = self.pageViewController.viewControllers?.first as? ProfileShowViewControllerProtocol {
            vc.childTableView?.isScrollEnabled = false
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let vc = self.pageViewController.viewControllers?.first as? ProfileShowViewControllerProtocol {
            vc.childTableView?.isScrollEnabled = !decelerate
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let vc = self.pageViewController.viewControllers?.first as? ProfileShowViewControllerProtocol {
            vc.childTableView?.isScrollEnabled = true
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let vc = self.pageViewController.viewControllers?.first as? ProfileShowViewControllerProtocol else {
            return
        }
        if 0 < scrollView.contentOffset.y || topView.frame.minY < 0 {
            let scroll = (topView.frame.origin.y < scrollView.contentOffset.y)
                ? scrollView.contentOffset.y : topView.frame.origin.y
            vc.childTableView?.contentOffset.y += scroll
            vc.resetContentOffsetY()
            scrollView.contentOffset.y = 0
        } else {
            isMoveTopView = false
            vc.childTableView?.contentOffset.y = scrollView.contentOffset.y
            self.pageViewController.tabBarTopConstraint?.constant = max(0, self.topView.frame.maxY - scrollView.contentOffset.y )
        }
    }
    
    func updateTopViewOriginY(_ y: CGFloat) {
        if isMoveTopView {
            topViewTopConstraint.constant = y
            self.pageViewController.tabBarTopConstraint?.constant = max(0, y + topViewHeight)
        }
        isMoveTopView = true
    }
}

extension LogViewController: HomeNavigationBarDelegate {
    func tappedSearchBar() {
        self.children.forEach {
            $0.childTableView?.setContentOffset(scrollView.contentOffset, animated: false)
            ($0.childTableView?.contentOffset = CGPoint(x: 0, y: -Int(($0.childTableView?.contentInset.top)!)))! }
    }
}

