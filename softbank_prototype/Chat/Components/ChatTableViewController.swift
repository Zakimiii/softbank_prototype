//
//  ChatTableViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/05.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
enum ChatTabIndex: Int {
    case index
    case chat
    case count
    
    var string: String {
        switch self {
        case .index: return chatTabString1
        case .chat: return chatTabString2
        case .count: return ""
        }
    }
}
@objcMembers
class ChatTableViewController: UITableViewController {
    var chatViewParent =  ChatViewController()
    enum Section: Int {
        case group
        case favorite
        case friend
        case follow
        case follower
        case count
        
        var count: Int {
            switch self {
            case .group: return GroupRow.count.rawValue
            case .favorite: return FavoriteRow.count.rawValue
            case .friend: return FriendRow.count.rawValue
            case .follow: return FollowRow.count.rawValue
            case .follower: return FollowerRow.count.rawValue
            case .count: return 0
            }
        }
        
        var string: String {
            switch self {
            case .group: return chatSectionString1
            case .favorite: return chatSectionString2
            case .friend: return chatSectionString3
            case .follow: return chatSectionString4
            case .follower: return chatSectionString5
            case .count: return ""
            }
        }
    }
    private enum GroupRow: Int {
        case content
        case a
        case b
        case c
        case count
    }
    private enum FavoriteRow: Int {
        case content
        case a
        case b
        case c
        case count
    }
    private enum FriendRow: Int {
        case content
        case a
        case b
        case c
        case count
    }
    private enum FollowRow: Int {
        case content
        case a
        case b
        case c
        case count
    }
    private enum FollowerRow: Int {
        case content
        case a
        case b
        case c
        case count
    }
    var currentTab: ChatTabIndex = .index
    private var openedSections:Set = [0, 1, 2, 3, 4]
    var bottomView: ChatRoomInputView!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.loadNIb()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNIb() {
        self.tableView?.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        self.tableView?.register(R.nib.chatProfileTableViewCell(), forCellReuseIdentifier: R.nib.chatProfileTableViewCell.name)
        self.tableView?.register(R.nib.chatGroupTableViewCell(), forCellReuseIdentifier: R.nib.chatGroupTableViewCell.name)
        self.tableView?.register(R.nib.chatShowTableViewCell(), forCellReuseIdentifier: R.nib.chatShowTableViewCell.name)
        self.tableView?.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
        self.tableView?.register(R.nib.chatProfileHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.chatProfileHeaderView.name)
        self.tableView?.estimatedRowHeight = 64
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.tableFooterView = UIView()
        self.tableView?.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        switch currentTab {
        case .index:  return Section.count.rawValue
        case .chat: return 1
        case .count: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else {
            return CGFloat.leastNormalMagnitude
        }
        switch currentTab {
        case .index:  return 44
        case .chat: return 0
        case .count: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch currentTab {
        case .index:
            guard let section = Section(rawValue: section) else {
                fatalError("This section is not exist")
            }
            if self.openedSections.contains(section.rawValue) {
                return section.count
            } else {
                return 0
            }
        case .chat:
            return 10
        case .count: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch currentTab {
        case .index:
            guard let section = Section(rawValue: section), let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.tableHeaderView.name) as? TableHeaderView else {
                return nil
            }
            //view.topBoaderView.isHidden = true
            view.titleLabel.text = section.string + " \(section.count)人"
            view.titleLabel.font = UIFont(name: hiragonoW6, size: 14)
            view.titleLabel.textColor = mainColor
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSection(_:))))
            view.tag = section.rawValue
            return view
        case .chat:
            return nil
        case .count:
            return nil
        }
    }
    
    func tapSection(_ sender: UIGestureRecognizer) {
        
        if let section = sender.view?.tag {
            if self.openedSections.contains(section) {
                self.openedSections.remove(section)
            } else {
                self.openedSections.insert(section)
            }
            self.tableView?.reloadSections(IndexSet(integer: section), with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentTab == .chat {
            return self.tableView(tableView, cellForChatRowAt: indexPath)
        }
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("This section is not exist")
        }
        switch section {
        case .group: return self.tableView(tableView, cellForGroupRowAt: indexPath)
        case .favorite: return self.tableView(tableView,cellForFovariteRowAt: indexPath)
        case .friend: return self.tableView(tableView,cellForFriendRowAt: indexPath)
        case .follow: return self.tableView(tableView,cellForFollowRowAt: indexPath)
        case .follower: return self.tableView(tableView,cellForFollowerRowAt: indexPath)
        case .count: fatalError("This row is not exist")
        }
    }
    
    private func tableView(_ tableView: UITableView, cellForChatRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.chatShowTableViewCell.name, for: indexPath) as? ChatShowTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeUsers[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForGroupRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.chatGroupTableViewCell.name, for: indexPath) as? ChatGroupTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeGroups[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForFovariteRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.chatProfileTableViewCell.name, for: indexPath) as? ChatProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeUsers[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForFriendRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.chatProfileTableViewCell.name, for: indexPath) as? ChatProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeUsers[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForFollowRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.chatProfileTableViewCell.name, for: indexPath) as? ChatProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeUsers[indexPath.row])
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForFollowerRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.chatProfileTableViewCell.name, for: indexPath) as? ChatProfileTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeUsers[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentTab == .chat {
            let secondVC = R.storyboard.chat.chatNewViewController()!
            self.navigationController?.pushViewController(secondVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        let secondVC = R.storyboard.profile.profileShowViewController()!
        secondVC.user = user1
        self.navigationController?.pushViewController(secondVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView.contentOffset.y <= self.tableView.sectionHeaderHeight && self.tableView.contentOffset.y >= 0 {
            self.tableView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y + 40, left: 0, bottom: 0, right: 0)
        } else if self.tableView.contentOffset.y >= self.tableView.sectionHeaderHeight {
            self.tableView.contentInset = UIEdgeInsets(top: -self.tableView.sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
}

extension ChatTableViewController: ChatViewControllerProtocol {
    var currentChatTab: ChatTabIndex {
        get {
            return self.currentTab
        }
        set {
            self.currentTab = newValue
        }
    }
    
    var childTableView: UITableView? {
        return self.tableView
    }
    
    var parentController: ChatViewController {
        get { return self.chatViewParent }
        set { self.chatViewParent = newValue }
    }
    var contentHeight: CGFloat {
        return self.tableView.estimatedRowHeight * CGFloat(ChatTableViewController.Section.count.rawValue * (ChatTableViewController.Section.group.count + ChatTableViewController.Section.favorite.count + ChatTableViewController.Section.friend.count + ChatTableViewController.Section.follow.count + ChatTableViewController.Section.follower.count))
    }
    func reloadData() {
        self.tableView?.reloadData()
    }
}


