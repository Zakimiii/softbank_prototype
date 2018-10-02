//
//  LogIndexTableViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@objcMembers
class LogIndexTableViewController: UITableViewController {
    var logs: [Log] = []
    var LogViewParent =  LogViewController()
    private var isAppeared = false
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.loadNIb()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNIb() {
        //self.tableView?.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        self.tableView?.register(R.nib.logTableViewCell(), forCellReuseIdentifier: R.nib.logTableViewCell.name)
        self.tableView?.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
        self.tableView?.estimatedRowHeight = 44
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.tableFooterView = UIView()
        self.tableView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isAppeared = false
        scrollTop()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isAppeared = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.logTableViewCell.name, for: indexPath) as? LogTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(logs[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = R.storyboard.log.logShowViewController()!
        secondVC.log = self.logs[indexPath.row]
        self.navigationController?.pushViewController(secondVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let navigationController = self.parentController.navigationController,
            let navigationBar = navigationController.navigationBar as? HomeNavigationBar else {
                fatalError("This navigationBar is not correct")
        }
        if (self.tableView.contentOffset.y <= 90 && self.tableView.contentOffset.y >= 0) {
            navigationBar.searchBar.isHidden = true
            //            self.tableView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if (self.tableView.contentOffset.y >= 90) {
            navigationBar.searchBar.isHidden = false
            //            self.tableView.contentInset = UIEdgeInsets(top: -self.tableView.sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
        
        if !isAppeared {
            DispatchQueue.main.async {
                self.tableView?.contentOffset.y = -(self.parentController.topViewTopConstraint.constant)
            }
            return
        }
        parentController.updateTopViewOriginY(-scrollView.contentOffset.y)
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        parentController.scrollView.isScrollEnabled = false
    }
    
    override  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        parentController.scrollView.isScrollEnabled = !decelerate
    }
    
    override  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        parentController.scrollView.isScrollEnabled = true
    }
}

extension LogIndexTableViewController: LogViewControllerProtocol {
    var childTableView: UITableView? {
        return self.tableView
    }
    
    var parentController: LogViewController {
        get { return self.LogViewParent }
        set { self.LogViewParent = newValue }
    }
    var contentHeight: CGFloat {
        return self.tableView.estimatedRowHeight * CGFloat(self.logs.count)
    }
    func reloadData() {
        self.tableView?.reloadData()
    }
}
