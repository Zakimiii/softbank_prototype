//
//  ChatNewViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@objcMembers
class ChatNewViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(R.nib.myChatViewCell(), forCellReuseIdentifier: R.nib.myChatViewCell.name)
            tableView.register(R.nib.yourChatViewCell(), forCellReuseIdentifier: R.nib.yourChatViewCell.name)
            tableView.estimatedRowHeight = 1000
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.tableFooterView = UIView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.keyboardDismissMode = .interactive
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
        }
    }
    @IBOutlet weak var chatRoomInputView: ChatRoomInputView!
    @IBOutlet weak var chatRoomInputViewBottom: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNaviBar()
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
                UIView.animate(withDuration: 0.3, animations: {
                    self.chatRoomInputViewBottom.constant += keyboardRect.height //- (self.tabBarController?.tabBar.frame.height ?? 60)
                    self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRect.height, right: 0)
                })
            }
        }
    }
    
    func keyboardWillHidden(notification: NSNotification) {
        UIView.animate(withDuration: 0.3, animations: {
            self.chatRoomInputViewBottom.constant = 0
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
        })
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

extension ChatNewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ChatNewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.myChatViewCell.name, for: indexPath) as? MyChatViewCell else {
                fatalError("The dequeued cell is not an instance of TextFieldCell.")
            }
            cell.clipsToBounds = true
            cell.updateCell(text: "今日は楽しかったです", time: "2018/12/29", isRead: true)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.yourChatViewCell.name, for: indexPath) as? YourChatViewCell else {
                fatalError("The dequeued cell is not an instance of TextFieldCell.")
            }
            cell.clipsToBounds = true
            cell.updateCell(text: "ありがとうございました！", time: "2018/12/29")
            return cell
        }
    }
    

}


