//
//  FieldTableViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/08.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class FieldTableViewController: UITableViewController {
    var currentTab: FieldSection = .category
    var fields: [Field] = []
    var fieldViewParent =  FieldViewController()
    private var isAppeared = false
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.loadNIb()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if currentTab == .field {
            setEditing(true, animated: true)
        }
        isAppeared = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isAppeared = true
    }
    
    func loadNIb() {
        self.tableView?.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        self.tableView?.register(R.nib.fieldTableViewCell(), forCellReuseIdentifier: R.nib.fieldTableViewCell.name)
        self.tableView?.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
        self.tableView?.estimatedRowHeight = 64
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.tableFooterView = UIView()
        self.tableView?.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentTab {
        case .category: return prototypeCategories.count//fields.count
        case .field: return prototypeFields.count//fields.count
        case .count: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.fieldTableViewCell.name, for: indexPath) as? FieldTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        switch currentTab {
        case .category:  cell.setData(prototypeCategories[indexPath.row])
        case .field: cell.setData(prototypeFields[indexPath.row].title ?? "")
        case .count: break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = R.storyboard.field.fieldNewViewController()!
        secondVC.index = indexPath.row
        self.navigationController?.pushViewController(secondVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension FieldTableViewController: FieldViewControllerProtocol {
    var currentSection: FieldSection {
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
    
    var parentController: FieldViewController {
        get { return self.fieldViewParent }
        set { self.fieldViewParent = newValue }
    }
    var contentHeight: CGFloat {
        return self.tableView.estimatedRowHeight * CGFloat(self.fields.count)
    }
    func reloadData() {
        self.tableView?.reloadData()
    }
}

