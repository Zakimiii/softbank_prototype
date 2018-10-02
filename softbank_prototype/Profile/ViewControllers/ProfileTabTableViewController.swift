//
//  ProfileTabTableViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

enum ProfileTabIndex: Int {
    case article
    case detail
    case contribute
    case network
    
    var allCases: [ProfileTabIndex] {
        return [.article, .detail, .contribute, .network]
    }
    
    var string: String {
        switch self {
        case .article:  return profileTabString1
        case .detail:   return profileTabString2
        case .contribute:  return profileTabString3
        case .network:   return profileTabString4
        }
    }
}
class ProfileTabTableViewController: UITableViewController {
    var items: [Any] {
        get {
            switch currentProfileTab {
            case .article: return logs
            case .detail:   return user
            case .contribute:  return []
            case .network:   return prototypeUsers
            }
        } set {
            switch currentProfileTab {
            case .article: logs = (newValue as? [Log] ?? [])
            case .detail:  user = (newValue as? [PrunedUser] ?? [])
            case .contribute: break
            case .network: break
            }
        }
    }
    var logs: [Log] = []
    var user: [PrunedUser] = []
    var listContents: [List] = []
    var groupContents: [Group] = []
    var users: [PrunedUser] = []
    var ProfileShowViewParent =  ProfileShowViewController()
    var currentProfileTab: ProfileTabIndex = .article
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.loadNIb()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNIb() {
//        self.tableView?.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        self.tableView?.register(R.nib.logTableViewCell(), forCellReuseIdentifier: R.nib.logTableViewCell.name)
        self.tableView?.register(R.nib.textFieldCell(), forCellReuseIdentifier: R.nib.textFieldCell.name)
        self.tableView?.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
        self.tableView?.estimatedRowHeight = 44
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.tableFooterView = UIView()
        self.tableView?.reloadData()
    }
    
    private var isAppeared = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch currentProfileTab {
        case .detail: return 44
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch currentProfileTab {
        case .detail:
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.tableHeaderView.name) as? TableHeaderView else {
                return nil
            }
            view.titleLabel.text = ["学歴", "職歴", "ステータス"][section]
            view.titleLabel.textColor = .black
            view.topBoaderView.isHidden = true
            view.buttomBoaderView.isHidden = true
            view.titleLabel.font = UIFont(name: hiragonoW6, size: 16)
            return view
        default: return nil
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        switch currentProfileTab {
        case .detail: return 3
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentProfileTab {
        case .detail: return 3
        default: return self.items.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch currentProfileTab {
        case .article: return self.tableView(tableView, cellForArticleRowAt: indexPath)
        case .detail: return self.tableView(tableView, cellForDetailRowAt: indexPath)
        case .contribute: return self.tableView(tableView, cellForContributeRowAt: indexPath)
        case .network: return self.tableView(tableView, cellForNetworkRowAt: indexPath)
        }
    }
    
    private func tableView(_ tableView: UITableView, cellForArticleRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.logTableViewCell.name, for: indexPath) as? LogTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(items[indexPath.row] as? Log ?? prototypeLog[0])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForDetailRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.textFieldCell.name, for: indexPath) as? TextFieldCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.titleLabel.text = [["大学", "高校", "中学校"],["現在の勤務先", "以前の勤務先", "以前の勤務先"], ["金融", "マーケティング", "統計学"]][indexPath.section][indexPath.row]
        cell.isEnabled = false
        cell.textField.text = [["バカ田大学", "バカ田高校", "バカ田中学"], ["SoftBank", "Inoventure Lab", "Google"], ["~半年", "半年~1年", "1年~"]][indexPath.section][indexPath.row]
        //cell.setData(items[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForContributeRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.homeTableViewCell.name, for: indexPath) as? HomeTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        //cell.setData(items[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForNetworkRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.logTableViewCell.name, for: indexPath) as? LogTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        //cell.setData(items[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = R.storyboard.log.logShowViewController()!
        //secondVC.log = self.items[indexPath.row]
        self.navigationController?.pushViewController(secondVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
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

extension ProfileTabTableViewController: ProfileShowViewControllerProtocol {
    
    var childTableView: UITableView? {
        return self.tableView
    }
    
    var parentController: ProfileShowViewController {
        get { return self.ProfileShowViewParent }
        set { self.ProfileShowViewParent = newValue }
    }
    var contentHeight: CGFloat {
        return self.tableView.estimatedRowHeight * CGFloat(self.items.count)
    }
    var currentTab: ProfileTabIndex {
        get { return self.currentProfileTab }
        set { self.currentProfileTab = newValue }
    }
    func reloadData() {
        self.tableView?.reloadData()
    }
}
