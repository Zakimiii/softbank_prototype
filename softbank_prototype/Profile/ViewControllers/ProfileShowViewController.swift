//
//  ProfileShowViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import TabPageViewController

protocol ProfileShowViewControllerProtocol: class {
    var childTableView: UITableView? { get }
    var currentTab: ProfileTabIndex { get set }
    var parentController: ProfileShowViewController { get set }
    var contentHeight: CGFloat { get }
    func reloadData()
    func resetHeaderView(height: CGFloat)
    func resetFooterView()
    func resetContentOffsetY()
    func scrollTop()
}

extension ProfileShowViewControllerProtocol {
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
class ProfileShowViewController: UIViewController {
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = 5
            profileImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var followLabel: UIButton!
    @IBOutlet weak var followerLabel: UIButton!
    @IBOutlet weak var friendLabel: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewTopConstraint: NSLayoutConstraint!
    private var topViewHeight: CGFloat = 0
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var actionView: PlusAction! {
        didSet {
            actionView.actionButton.setImage(R.image.commentIcon()!.withRenderingMode(.alwaysTemplate), for: .normal)
            actionView.actionButton.setImage(R.image.commentIcon()!.withRenderingMode(.alwaysTemplate), for: .highlighted)
            actionView.layer.shadowColor = UIColor.black.cgColor
            actionView.layer.shadowOpacity = 0.5
            actionView.layer.shadowOffset = CGSize(width: 5, height: 5)
            actionView.layer.shadowRadius = 5
            actionView.delegate = self
        }
    }
    var user: PrunedUser!
    @IBOutlet weak var fieldLabel: UILabel!
    var contents: [Content] = prototypeContents //Prototype
    var fields: [Field] = prototypeFieldForContent //Prototype
    private var isMoveTopView = true
    private var children: [ProfileShowViewControllerProtocol] = []
    private var pageViewController: TabPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
        self.setupPageViewController()
        DispatchQueue.main.async {
            self.children.forEach { $0.reloadData() }
        }
    }
    
    private func setupProfile() {
        backImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        profileImage.image = prototypeImage[Int(arc4random()) % prototypeImage.count]
        nameLabel.text = user.nickname ?? ""
        self.fieldLabel.text = "#マーケティング #統計学 #金融学"
        self.detailLabel.text = "宜しくおねがいします"
        self.followLabel.setTitle("フォロー \(String(describing: self.user.stats?.followCount ?? 0))", for: .normal)
        self.followerLabel.setTitle("フォロワー \(String(describing: self.user.stats?.followedCount ?? 0))", for: .normal)
        self.friendLabel.setTitle("友達 12", for: .normal)
//        var str = ""
//        self.fieldLabel.text = ""
//        _ = prototypeUserFielding.filter { $0.content! == content }.compactMap {
//            str += "#\(($0.field!.title ?? "")) "
//        }
//        _ = str.components(separatedBy: " ").unique.compactMap {
//            self.fieldLabel.text! += $0
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNaviBar()
        updateTopViewFrame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let navigationController = self.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        navigationBar.deinitContentView()
        navigationBar.enableButton()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateTopViewFrame()
    }
    
    private func setupNaviBar() {
        guard let navigationController = self.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        navigationBar.disableButton()
        navigationBar.initContentView()
        let backButton: UIBarButtonItem = UIBarButtonItem(image: R.image.left()!.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(self.tappedBackFn))
        navigationBar.pushNavigationBar.items![0].setLeftBarButtonItems([backButton], animated: true)
    }
    
    func tappedBackFn(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateTopViewFrame() {
        children.forEach {
            $0.resetHeaderView(height: self.topView.frame.height)
            $0.resetFooterView()
        }
        if topViewHeight != self.topView.frame.height {
            self.pageViewController.tabBarTopConstraint?.constant = self.topView.frame.maxY
            self.topViewHeight = self.topView.frame.height
        }
    }
}

extension ProfileShowViewController: TabPageViewControllerDelegate {
    
    func tabPageViewController(_ viewController: TabPageViewController, updateCurrentIndex index: Int) {
        children.forEach { $0.childTableView?.isScrollEnabled = true }
    }
    
    private func setupPageViewController() {
        pageViewController = TabPageViewController()
        pageViewController.tabPageDelegate = self
        pageViewController.isInfinity = false
        let vc1 = ProfileTabTableViewController(nibName: R.nib.profileTabTableViewController.name, bundle: nil)
        let vc2 = ProfileTabTableViewController(nibName: R.nib.profileTabTableViewController.name, bundle: nil)
        let vc3 = ProfileTabTableViewController(nibName: R.nib.profileTabTableViewController.name, bundle: nil)
        let vc4 = ProfileTabTableViewController(nibName: R.nib.profileTabTableViewController.name, bundle: nil)
        vc1.items = prototypeLog
        vc2.user = [self.user]
        self.children = [vc1, vc2, vc3, vc4]
        for child in self.children.enumerated() {
            child.element.parentController = self
            child.element.currentTab = ProfileTabIndex(rawValue: child.offset)!
            pageViewController.tabItems.append(([vc1, vc2, vc3, vc4][child.offset], ProfileTabIndex(rawValue: child.offset)!.string))
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

extension ProfileShowViewController: PlusActionDelegate {
    func tappedButton(_ button: UIButton) {
//        self.performSegue(withIdentifier: R.segue.homeViewController.toContent.identifier, sender: nil)
    }
}

extension ProfileShowViewController: UIScrollViewDelegate {
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
