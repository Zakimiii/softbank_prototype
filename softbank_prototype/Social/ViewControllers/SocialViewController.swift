//
//  SocialViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import TabPageViewController

@objcMembers
class SocialViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = BaseCollectionViewCell.getSize().height
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.tableFooterView = UIView()
            tableView.register(R.nib.searchCategoryTableCell(), forCellReuseIdentifier: R.nib.searchCategoryTableCell.name)
            tableView.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
        }
    }
    @IBOutlet weak var menuContainerView: UIView! {
        didSet {
            menuContainerView.isHidden = true
        }
    }
    @IBOutlet weak var searchContainerView: UIView! {
        didSet {
            searchContainerView.isHidden = true
        }
    }
    @IBOutlet weak var menuContainerWidth: NSLayoutConstraint!
    private var menuAnimated = false
    override func viewWillAppear(_ animated: Bool) {
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


extension SocialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = SocialSection(rawValue: section), !section.string.isEmpty else {
            fatalError("This section is not exist")
        }
        switch section {
        case .list: return 0
        default: return 70
        }
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = SocialSection(rawValue: section), !section.string.isEmpty else {
            fatalError("This section is not exist")
        }
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.tableHeaderView.name) as? TableHeaderView else {
            return nil
        }
        view.titleLabel.text = section.string
        view.titleLabel.textColor = .black
        view.topBoaderView.isHidden = true
        view.buttomBoaderView.isHidden = true
        switch section {
        case .list: return nil
            case .header:
                view.titleLabel.font = UIFont(name: hiragonoW6, size: 24)
            default:
                view.titleLabel.font = UIFont(name: hiragonoW6, size: 16)
        }
        return view
    }
}

extension SocialViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SocialSection.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SocialSection(rawValue: section), !section.string.isEmpty else {
            fatalError("This section is not exist")
        }
        switch section {
        case .list: return 0
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.searchCategoryTableCell.name, for: indexPath) as? SearchCategoryTableCell,
              let section = SocialSection(rawValue: indexPath.section) else {
            fatalError("The dequeued cell is not an instance of SearchCategoryTableCell.")
        }
        cell.delegate = self
        cell.currentSection = section
        switch section  {
        case .header:
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = SocialHeaderCollectionViewCell.getSize()
            layout.scrollDirection = .horizontal
            cell.collectionView.collectionViewLayout = layout
            cell.cellHeight.constant = SocialHeaderCollectionViewCell.getSize().height
            cell.items = prototypeLog
        case .ranking:
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize =  CGSize(width: SocialRankingCollectionViewCell.getSize().width, height: SocialRankingCollectionViewCell.getSize().height / 5)
            layout.scrollDirection = .horizontal
            cell.collectionView.collectionViewLayout = layout
            cell.cellHeight.constant = SocialRankingCollectionViewCell.getSize().height
            cell.items = prototypeLog
        case .list:
            break
            cell.items = prototypeLists
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = BaseCollectionViewCell.getSize()
            layout.scrollDirection = .horizontal
            cell.collectionView.collectionViewLayout = layout
            cell.cellHeight.constant = BaseCollectionViewCell.getSize().height
        case .group:
            cell.items = prototypeGroups
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = BaseCollectionViewCell.getSize()
            layout.scrollDirection = .horizontal
            cell.collectionView.collectionViewLayout = layout
            cell.cellHeight.constant = BaseCollectionViewCell.getSize().height
        case .user:
            cell.items = prototypeUsers
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = BaseCollectionViewCell.getSize()
            layout.scrollDirection = .horizontal
            cell.collectionView.collectionViewLayout = layout
            cell.cellHeight.constant = BaseCollectionViewCell.getSize().height * 2.1
        case .count:
            fatalError("This section is not exist.")
        }
//        cell.collectionView.delegate = self
//        cell.collectionView.dataSource = self
        return cell
    }
}

extension SocialViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.tableView.contentOffset.y <= 70 && self.tableView.contentOffset.y >= 0) {
            self.tableView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 60, right: 0)
        } else if (self.tableView.contentOffset.y >= 70) {
            self.tableView.contentInset = UIEdgeInsets(top: -70, left: 0, bottom: 60, right: 0)
        }
    }
}

extension SocialViewController: SearchBarDelegate {
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

extension SocialViewController: MenuViewDelegate {
    func tapMenuView(_ view: MenuView) {
        if !self.menuAnimated {
            view.toChangeClose()
            self.menuContainerView.fadeIn(type: .Normal, completed: nil)
            UIView.animate(withDuration: 0.3, animations: {
                self.menuContainerWidth.constant = self.view.frame.width
            })
            self.menuAnimated = true
        } else {
            view.toChangeMenu()
            UIView.animate(withDuration: 0.3, animations: {
                self.menuContainerWidth.constant = 0
            })
            self.menuContainerView.fadeOut(type: .Normal, completed: nil)
            self.menuAnimated = false
        }
    }
}

extension SocialViewController: SearchCategoryTableCellDelegate {
    func tapNew(_ log: Log) {
        let secondVC = R.storyboard.log.logShowViewController()!
        secondVC.log = log
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    func tapRanking(_ log: Log){
        let secondVC = R.storyboard.log.logShowViewController()!
        secondVC.log = log
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    func tapList(_ list: List){
        
    }
    func tapGroup(_ group: Group){
        
    }
    func tapUser(_ user: PrunedUser){
        let secondVC = R.storyboard.profile.profileShowViewController()!
        secondVC.user = user
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
