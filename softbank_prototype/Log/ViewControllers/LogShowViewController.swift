//
//  LogShowViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@objcMembers
class LogShowViewController: UIViewController {
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
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 44
            tableView.tableFooterView = UIView()
            tableView.register(R.nib.contentHeaderCell(),forCellReuseIdentifier: R.nib.contentHeaderCell.name)
            tableView.register(R.nib.logShowTableViewCell(),forCellReuseIdentifier: R.nib.logShowTableViewCell.name)
            tableView.register(R.nib.commentIndexTableViewCell(),forCellReuseIdentifier: R.nib.commentIndexTableViewCell.name)
            tableView.register(R.nib.filterHeader(), forHeaderFooterViewReuseIdentifier: R.nib.filterHeader.name)
        }
    }
    var log: Log = prototypeLog[0]
    var comment = [LogComment(_id: 1, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, logId: nil, log: nil, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil), LogComment(_id: 2, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, logId: nil, log: nil, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil), LogComment(_id: 3, detail: "わかりました。ありがとうございました！", userId: user1._id, user: user1, logId: nil, log: nil, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)]
    private enum Section:Int {
        case header
        case title
        case comment
        case count
        
        var count: Int {
            switch self {
            case .header: return HeaderRow.count.rawValue
            case .title: return TitleRow.count.rawValue
            case .comment: return 3
            case .count: return 0
            }
        }
    }
    
    private enum HeaderRow:Int {
        case title
        case count
    }
    
    private enum TitleRow:Int {
        case title
        case count
    }
    
    private enum CommentRow:Int {
        case title
        case count
    }
    
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

extension LogShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else {
            return CGFloat.leastNormalMagnitude
        }
        switch section {
        case .comment: return 44
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Section(rawValue: section), let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.filterHeader.name) as? FilterHeader, section == .comment else {
            return nil
        }
        view.titleLabel.text = "コメント \(comment.count)件"
        return view
    }
}

extension LogShowViewController: UITableViewDataSource {
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
        case .header: return self.tableView(tableView, cellForHeaderRowAt: indexPath)
        case .title:  return self.tableView(tableView, cellForTitleRowAt: indexPath)
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
        cell.setData(log: log)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForTitleRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = TitleRow(rawValue: indexPath.row) else {
            fatalError("The row is not exists.")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.logShowTableViewCell.name, for: indexPath) as? LogShowTableViewCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        cell.delegate = self
        cell.setData(log)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForCommentRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let row = CommentRow(rawValue: indexPath.row) else {
//            fatalError("The row is not exists.")
//        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.commentIndexTableViewCell.name, for: indexPath) as? CommentIndexTableViewCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        cell.delegate = self
        cell.setData(logComment: self.comment[indexPath.row])
        return cell
    }
    
}
extension LogShowViewController: PlusActionDelegate {
    func tappedButton(_ button: UIButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                let indexPath = IndexPath(row: CommentRow.title.rawValue, section: Section.comment.rawValue)
                self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
            })
        }
    }
}

extension LogShowViewController: LogShowTableViewDelegate {
    func tapOwnerData(_ user: PrunedUser) {
        let secondVC = R.storyboard.profile.profileShowViewController()!
        secondVC.user = user
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension LogShowViewController: CommentIndexTableViewDelegate {
}
