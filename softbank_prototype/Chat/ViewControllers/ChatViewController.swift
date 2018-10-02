//
//  ChatViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/05.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import TabPageViewController


protocol ChatViewControllerProtocol: class {
    var childTableView: UITableView? { get }
    var currentChatTab: ChatTabIndex { get set }
    var parentController: ChatViewController { get set }
    var contentHeight: CGFloat { get }
    func reloadData()
}

extension ChatViewControllerProtocol {
    var maxVisibleHeight: CGFloat {
        var safeAreaBottom: CGFloat = 0
        if #available(iOS 11.0, *) {
            safeAreaBottom = parentController.containerView.safeAreaInsets.bottom
        }
        return parentController.containerView.frame.height - 40 - safeAreaBottom
    }
    
    
    func reloadData() {
        childTableView?.reloadData()
    }
}

@objcMembers
class ChatViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuContainerView: UIView! {
        didSet {
            menuContainerView.isHidden = true
        }
    }
    @IBOutlet weak var menuContainerViewWidth: NSLayoutConstraint!
    @IBOutlet weak var searchContainerView: UIView! {
        didSet {
            searchContainerView.isHidden = true
        }
    }
    @IBOutlet weak var actionView: PlusAction! {
        didSet {
            actionView.layer.shadowColor = UIColor.black.cgColor
            actionView.layer.shadowOpacity = 0.5
            actionView.layer.shadowOffset = CGSize(width: 5, height: 5)
            actionView.layer.shadowRadius = 5
            //actionView.delegate = self
        }
    }
    private var children: [ChatViewControllerProtocol] = []
    private var pageViewController: TabPageViewController!
    private var menuAnimated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPageViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNaviBar()
    }
    
    func setupNaviBar(){
        guard let navigationController = self.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        navigationBar.searchEnabled()
        navigationBar.searchBar.delegate = self
        navigationBar.menuView.delegate = self
        navigationBar.chatButton.addTarget(self, action: #selector(self.tapChat), for: .touchUpInside)
    }
    
    func tapChat() {
        
    }
    
}

extension ChatViewController: TabPageViewControllerDelegate {
    
    func tabPageViewController(_ viewController: TabPageViewController, updateCurrentIndex index: Int) {
        children.forEach { $0.childTableView?.isScrollEnabled = true }
    }
    
    private func setupPageViewController() {
        pageViewController = TabPageViewController()
        pageViewController.tabPageDelegate = self
        pageViewController.isInfinity = false
        let vc1 = ChatTableViewController(nibName: R.nib.chatTableViewController.name, bundle: nil)
        let vc2 = ChatTableViewController(nibName: R.nib.chatTableViewController.name, bundle: nil)
        let vc3 = ChatTableViewController(nibName: R.nib.chatTableViewController.name, bundle: nil)
        self.children = [vc1, vc2, vc3]
        for child in self.children.enumerated() {
            child.element.parentController = self
            child.element.currentChatTab = ChatTabIndex(rawValue: child.offset)!
            pageViewController.tabItems.append(([vc1, vc2, vc3][child.offset], ChatTabIndex(rawValue: child.offset)!.string))
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
        containerView.bringSubview(toFront: self.actionView)
    }
}

extension ChatViewController: SearchBarDelegate {
    func searchBar(_ searchBar: SearchBar, searched keyword: String?) {
    }
    
    func searchBar(_ searchBar: SearchBar, accessoryButtonTapped keyword: String?) -> Bool {
        searchBar.keyword = nil
        return true
    }
    
    func searchBarDidBeginEditing() {
        guard let navigationController = self.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        navigationBar.menuView.fadeOut(type: .Normal, completed: nil)
        navigationBar.chatButton.fadeOut(type: .Normal, completed: nil)
        self.searchContainerView.fadeIn(type: .Normal, completed: nil)
    }
    
    func searchBarDidEndEditing() {
        guard let navigationController = self.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        navigationBar.menuView.fadeIn(type: .Normal, completed: nil)
        navigationBar.chatButton.fadeIn(type: .Normal, completed: nil)
        self.searchContainerView.fadeOut(type: .Normal, completed: nil)
    }
}

extension ChatViewController: MenuViewDelegate {
    func tapMenuView(_ view: MenuView) {
        if !self.menuAnimated {
            view.toChangeClose()
            self.menuContainerView.fadeIn(type: .Normal, completed: nil)
            UIView.animate(withDuration: 0.3, animations: {
                self.menuContainerViewWidth.constant = self.view.frame.width
            })
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
