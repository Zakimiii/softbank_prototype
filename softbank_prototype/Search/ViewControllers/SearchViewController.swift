//
//  SearchViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/01.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@objcMembers
class SearchViewController: UIViewController {
    private enum Section: Int {
        case history
        case field
        case count
        
        var count: Int {
            switch self {
            case .history: return HistoryRow.count.rawValue
            case .field:   return FieldRow.count.rawValue
            case .count:   return 0
            }
        }
        
        var string: String {
            switch self {
            case .history: return "検索履歴"
            case .field:   return "カテゴリーから検索する"
            case .count:   fatalError("This row is not exists")
            }
        }
    }
    private enum HistoryRow: Int {
        case text1
        case text2
        case text3
        case text4
        case text5
        case count
    }
    private enum FieldRow: Int {
        case text1
        case text2
        case text3
        case text4
        case text5
        case count
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(R.nib.baseTableViewCell(), forCellReuseIdentifier: R.nib.baseTableViewCell.name)
            self.tableView.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
            self.tableView.estimatedRowHeight = 44
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.tableFooterView = UIView()
            self.tableView.reloadData()
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.backgroundView?.backgroundColor = .clear
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShown(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHidden(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func keyboardWillShown(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: keyboardRect.height))
            }
        }
    }
    
    func keyboardWillHidden(notification: NSNotification) {
        self.tableView.tableFooterView = UIView()
        self.view.layoutIfNeeded()
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Section(rawValue: section), !section.string.isEmpty else {
            return nil
        }
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.tableHeaderView.name) as? TableHeaderView else {
            return nil
        }
        view.topBoaderView.isHidden = true
        view.buttomBoaderView.isHidden = true
        view.setFontSize(13)
        view.titleLabel.text = section.string
        return view
    }
}

extension SearchViewController: UITableViewDataSource {
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
        case .history:return  self.tableView(tableView, cellForHistoryRowAt: indexPath)
        case .field:  return  self.tableView(tableView, cellForFieldRowAt: indexPath)
        case .count:    fatalError("The section is disabled.")
        }
    }
    
    private func tableView(_ tableView: UITableView, cellForHistoryRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = HistoryRow(rawValue: indexPath.row) else {
            fatalError("The row is not exists.")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.baseTableViewCell.name, for: indexPath) as? BaseTableViewCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        cell.setData()
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForFieldRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = FieldRow(rawValue: indexPath.row) else {
            fatalError("The row is not exists.")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.baseTableViewCell.name, for: indexPath) as? BaseTableViewCell else {
            fatalError("The dequeued cell is not an instance of Cell.")
        }
        cell.setData()
        cell.contentView.backgroundColor = .clear
        return cell
    }
}

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.tableView.contentOffset.y <= self.tableView.sectionHeaderHeight && self.tableView.contentOffset.y >= 0) {
            self.tableView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if (self.tableView.contentOffset.y >= self.tableView.sectionHeaderHeight) {
            self.tableView.contentInset = UIEdgeInsets(top: -self.tableView.sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
}

