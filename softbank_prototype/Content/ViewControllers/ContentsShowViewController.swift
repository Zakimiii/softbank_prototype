//
//  ContentsShowViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@objcMembers
class ContentsShowViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 1000
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.register(R.nib.contentHeaderCell(), forCellReuseIdentifier: R.nib.contentHeaderCell.name)
            tableView.register(R.nib.singleProfileCell(), forCellReuseIdentifier: R.nib.singleProfileCell.name)
            tableView.register(R.nib.searchCategoryTableCell(), forCellReuseIdentifier: R.nib.searchCategoryTableCell.name)
            tableView.register(R.nib.contentShowFooterCell(), forCellReuseIdentifier: R.nib.contentShowFooterCell.name)
            tableView.register(R.nib.contentArticleTableViewCell(), forCellReuseIdentifier: R.nib.contentArticleTableViewCell.name)
            tableView.register(R.nib.commentIndexTableViewCell(), forCellReuseIdentifier: R.nib.commentIndexTableViewCell.name)
            tableView.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
            tableView.register(R.nib.filterHeader(), forHeaderFooterViewReuseIdentifier: R.nib.filterHeader.name)
        }
    }
    
    @IBOutlet weak var plusAction: PlusAction! {
        didSet {
            plusAction.actionButton.setImage(R.image.commentIcon()!.withRenderingMode(.alwaysTemplate), for: .normal)
            plusAction.actionButton.setImage(R.image.commentIcon()!.withRenderingMode(.alwaysTemplate), for: .highlighted)
            plusAction.layer.shadowColor = UIColor.black.cgColor
            plusAction.layer.shadowOpacity = 0.5
            plusAction.layer.shadowOffset = CGSize(width: 5, height: 5)
            plusAction.layer.shadowRadius = 5
            plusAction.delegate = self
        }
    }
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dummyTextView: UITextView! {
        didSet {
            dummyTextView.isHidden = true
            dummyTextView.delegate = self
        }
    }
    var noticed: Bool = false
    private enum Section: Int {
        case header
        case detail
        case profile
        case relation
        case comment
        case count
        
        var count: Int {
            switch self {
            case .header:       return HeaderRow.count.rawValue
            case .detail:       return DetailRow.count.rawValue
            case .profile:      return ProfileRow.count.rawValue
            case .relation:     return 1
            case .comment:      return 3
            case .count:        return 0
            }
        }
        
        var string: String {
            switch self {
            case .header:       return ""
            case .detail:       return ""
            case .profile:      return ""
            case .relation:     return "関連記事"
            case .comment:      return "コメント"
            case .count:        return ""
            }
        }
    }
    private enum HeaderRow: Int {
        case content
        case count
    }
    private enum ProfileRow: Int {
        case content
        case count
    }
    private enum DetailRow: Int {
        case text
        case count
    }
    private enum CommentRow: Int {
        case comment
        case count
    }
    var content: Content?
    var comment = [ContentComment(_id: 1, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, contentId: nil, content: nil, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil), ContentComment(_id: 2, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, contentId: nil, content: nil, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil), ContentComment(_id: 3, detail: "わかりました。ありがとうございました！", userId: user1._id, user: user1, contentId: nil, content: nil, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)]
    
    override func viewWillAppear(_ animated: Bool) {
        setupNaviBar()
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
    
}

extension ContentsShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else {
            return CGFloat.leastNormalMagnitude
        }
        switch section {
        case .relation: return 70
        case .comment: return 44
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Section(rawValue: section) else {
            return nil
        }
        switch section {
        case .relation:
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.tableHeaderView.name) as? TableHeaderView else {
                return nil
            }
            view.titleLabel.text = section.string
            view.titleLabel.textColor = .black
            view.topBoaderView.isHidden = true
            view.buttomBoaderView.isHidden = true
            view.titleLabel.font = UIFont(name: hiragonoW6, size: 16)
            return view
        case .comment:
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.filterHeader.name) as? FilterHeader else {
                return nil
            }
            view.titleLabel.text = section.string + " \(comment.count)件"
            return view
        default: return nil
        }
        return nil
    }
}

extension ContentsShowViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }
        return  section.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("The section is not exists.")
        }
        switch section {
        case .header:   return self.tableView(tableView, cellForHeaderRowAt: indexPath)
        case .profile:  return self.tableView(tableView, cellForProfileRowAt: indexPath)
        case .detail:   return self.tableView(tableView, cellForDetailRowAt: indexPath)
        case .relation: return self.tableView(tableView, cellForRelationRowAt: indexPath)
        case .comment:  return self.tableView(tableView, cellForCommentRowAt: indexPath)
        case .count:    fatalError("The section is disabled.")
        }
    }
    
    private func tableView(_ tableView: UITableView, cellForHeaderRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = HeaderRow(rawValue: indexPath.row) else {
            fatalError("The row is not exists.")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.contentHeaderCell.name, for: indexPath) as? ContentHeaderCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        cell.setData(content: content!)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForProfileRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = ProfileRow(rawValue: indexPath.row) else {
            fatalError("The row is not exists.")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.contentShowFooterCell.name, for: indexPath) as? ContentShowFooterCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        DispatchQueue.main.async {
            cell.delegate = self
            cell.setData((self.content?.user)!)
        }
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForDetailRowAt indexPath: IndexPath) -> UITableViewCell {
        guard Section(rawValue: indexPath.section) == .detail,let row = DetailRow(rawValue: indexPath.row) else {
            fatalError("The row is not exists.")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.contentArticleTableViewCell.name, for: indexPath) as? ContentArticleTableViewCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        DispatchQueue.main.async {
            cell.delegate = self
            cell.setData()
        }
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForRelationRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.searchCategoryTableCell.name, for: indexPath) as? SearchCategoryTableCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        cell.delegate = self
        cell.currentSection = .ranking
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize(width: SocialRankingCollectionViewCell.getSize().width, height: SocialRankingCollectionViewCell.getSize().height / 5)
        layout.scrollDirection = .horizontal
        cell.collectionView.collectionViewLayout = layout
        cell.cellHeight.constant = SocialRankingCollectionViewCell.getSize().height
        cell.items = prototypeRankingContents
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForCommentRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.commentIndexTableViewCell.name, for: indexPath) as? CommentIndexTableViewCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        DispatchQueue.main.async {
            cell.delegate = self
            cell.setData(contentComment: self.comment[indexPath.row])
        }
        return cell
    }
}

extension ContentsShowViewController: ContentArticleTableViewCellDelegate {
    func noticeDidLoad() {
        guard !noticed else {
            return
        }
        self.noticed = true
        self.tableView.reloadData()
    }
    
}

extension ContentsShowViewController: PlusActionDelegate {
    func tappedButton(_ button: UIButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                let indexPath = IndexPath(row: CommentRow.comment.rawValue, section: Section.comment.rawValue)
                self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
            })
        }
        let commentField = CommentFieldView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 128))
        commentField.layer.borderWidth = 1
        commentField.layer.borderColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0).cgColor
        commentField.textView.delegate = self
        dummyTextView.inputAccessoryView = commentField
        dummyTextView.becomeFirstResponder()
        commentField.textView.becomeFirstResponder()
        dummyTextView.resignFirstResponder()
    }
}

extension ContentsShowViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (self.tableView.contentOffset.y <= self.tableView.sectionHeaderHeight && self.tableView.contentOffset.y >= 0) {
//            self.tableView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
//        } else if (self.tableView.contentOffset.y >= self.tableView.sectionHeaderHeight) {
//            self.tableView.contentInset = UIEdgeInsets(top: -44, left: 0, bottom: 0, right: 0)
//        }
//    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}

extension ContentsShowViewController: UITextViewDelegate {
    
}

extension ContentsShowViewController: ContentShowFooterCellDelegate {
    func tapOwnerData(_ user: PrunedUser) {
        let secondVC = R.storyboard.profile.profileShowViewController()!
        secondVC.user = user
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension ContentsShowViewController: CommentIndexTableViewDelegate {
}

extension ContentsShowViewController: SearchCategoryTableCellDelegate {
    func tapRanking(_ content: Content) {
        let secondVC = R.storyboard.content.contentsShowViewController()!
        secondVC.content = content
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

