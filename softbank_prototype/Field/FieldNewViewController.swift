//
//  FieldNewViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/08.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class FieldNewViewController: UIViewController {
    var index: Int!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
//            self.tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
            self.tableView.register(R.nib.fieldTableViewCell(), forCellReuseIdentifier: R.nib.fieldTableViewCell.name)
            self.tableView.register(R.nib.tableHeaderView(), forHeaderFooterViewReuseIdentifier: R.nib.tableHeaderView.name)
            self.tableView.estimatedRowHeight = 64
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.tableFooterView = UIView()
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
}

extension FieldNewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prototypeFieldsForTop[index].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.fieldTableViewCell.name, for: indexPath) as? FieldTableViewCell else {
            fatalError("The dequeued cell is not an instance of TextFieldCell.")
        }
        cell.setData(prototypeFieldsForTop[index][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let secondVC = R.storyboard.content.contentsShowViewController()!
//        //secondVC.content = self.contents[indexPath.row]
//        self.navigationController?.pushViewController(secondVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
