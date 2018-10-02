//
//  SearchCategoryTableCell.swift
//  salomee-ios
//
//  Created by noriki.iwamatsu on 2018/06/11.
//  Copyright © 2018年 Personize Inc. All rights reserved.
//

import UIKit
protocol SearchCategoryTableCellDelegate: class {
    func tapNew(_ log: Log)
    func tapRanking(_ log: Log)
    func tapList(_ list: List)
    func tapGroup(_ group: Group)
    func tapUser(_ user: PrunedUser)
}
extension SearchCategoryTableCellDelegate where Self: UIViewController {
    func tapNew(_ log: Log){}
    func tapRanking(_ log: Log){}
    func tapList(_ list: List){}
    func tapGroup(_ group: Group){}
    func tapUser(_ user: PrunedUser){}
}
class SearchCategoryTableCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(R.nib.baseCollectionViewCell(), forCellWithReuseIdentifier: R.nib.baseCollectionViewCell.name)
            collectionView.register(R.nib.socialHeaderCollectionViewCell(), forCellWithReuseIdentifier: R.nib.socialHeaderCollectionViewCell.name)
            collectionView.register(R.nib.socialRankingCollectionViewCell(), forCellWithReuseIdentifier: R.nib.socialRankingCollectionViewCell.name)
        }
    }
    @IBOutlet weak var cellHeight: NSLayoutConstraint!
    var currentSection: SocialSection = .header {
        didSet {
            collectionView.reloadData()
        }
    }
    var items: [Any] {
        get {
            switch currentSection {
            case .header: return headerContents
            case .ranking: return rankingContents
            case .list: return listContents
            case .group: return groupContents
            case .user: return users
            default: return []
            }
        }
        set{
            switch currentSection {
            case .header: headerContents = (newValue as? [Log]) ?? []
            case .ranking: rankingContents = (newValue as? [Log]) ?? []
            case .list: listContents = (newValue as? [List]) ?? []
            case .group: groupContents = (newValue as? [Group]) ?? []
            case .user: users = (newValue as? [PrunedUser]) ?? []
            default: break
            }
        }
    }
    weak var delegate: SearchCategoryTableCellDelegate!
    var headerContents: [Log] = []
    var rankingContents: [Log] = []
    var listContents: [List] = []
    var groupContents: [Group] = []
    var users: [PrunedUser] = []
    class func getHeight() -> CGFloat {
        let width = (UIScreen.main.bounds.width - (20 * 2)) / 2
        let height = (20 * 2) + (12 * 3) + width
        return height
    }
}

extension SearchCategoryTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //        guard indexPath.section == HomeSection.Stream.rawValue,
        //            let count = streams?.count else {
        //                return
        //        }
        //        if count % 30 == 0 && (isShowAdverts ? indexPath.row + 1 >= count + count / (ADVERT_INTERVAL - 1) : indexPath.row + 1 >= count) {
        //            loadMore()
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch currentSection {
        case .header:
            self.delegate?.tapNew(self.items[indexPath.row] as? Log ?? prototypeLog[0])
        case .ranking:
            self.delegate?.tapRanking(self.items[indexPath.row] as? Log ?? prototypeLog[0])
        case .list:
            self.delegate?.tapList(self.items[indexPath.row] as? List ?? prototypeLists[0])
        case .group:
            self.delegate?.tapGroup(self.items[indexPath.row] as? Group ?? prototypeGroups[0])
        case .user:
            self.delegate?.tapUser(self.items[indexPath.row] as? PrunedUser ?? user1)
        case .count: break
        }
    }
    
}

extension SearchCategoryTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.currentSection {
            case .header: return self.collectionView(collectionView, cellForHeaderItemAt: indexPath)
            case .ranking: return self.collectionView(collectionView, cellForRankingItemAt: indexPath)
            case .list: return self.collectionView(collectionView, cellForListItemAt: indexPath)
            case .group: return self.collectionView(collectionView, cellForGroupItemAt: indexPath)
            case .user: return self.collectionView(collectionView, cellForUserItemAt: indexPath)
            case .count: fatalError("This section is not exist.")
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForHeaderItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.socialHeaderCollectionViewCell.name, for: indexPath) as? SocialHeaderCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of CollectionCell.")
        }
        cell.setData(items[indexPath.row] as? Log ?? prototypeLog[0])
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForRankingItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.socialRankingCollectionViewCell.name, for: indexPath) as? SocialRankingCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of CollectionCell.")
        }
        cell.setData(items[indexPath.row] as? Log ?? prototypeLog[0])
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForListItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.baseCollectionViewCell.name, for: indexPath) as? BaseCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of CollectionCell.")
        }
        cell.listView.isHidden = false
        cell.setData(list: self.items[indexPath.row] as? List)
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForGroupItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.baseCollectionViewCell.name, for: indexPath) as? BaseCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of CollectionCell.")
        }
        cell.setData(group: self.items[indexPath.row] as? Group)
        cell.groupView.isHidden = false
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForUserItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.baseCollectionViewCell.name, for: indexPath) as? BaseCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of CollectionCell.")
        }
        cell.setData(user: self.items[indexPath.row] as? PrunedUser)
        cell.containerView.layer.cornerRadius = cell.containerView.bounds.width / 2 - 9
        cell.containerView.clipsToBounds = true
        cell.groupView.isHidden = false
        cell.followButton.followText = ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return BaseCollectionViewCell.getSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
    }
}
