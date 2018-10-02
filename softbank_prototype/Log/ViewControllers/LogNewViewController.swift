//
//  LogNewViewController.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import PopupDialog

@objcMembers
class LogNewViewController: UIViewController {
    
    @IBOutlet weak var textView: PlaceHolderTextView! {
        didSet {
            textView.delegate = self
        }
    }
    
    @IBOutlet weak var actionView: PlusAction! {
        didSet {
            actionView.layer.shadowColor = UIColor.black.cgColor
            actionView.layer.shadowOpacity = 0.5
            actionView.layer.shadowOffset = CGSize(width: 5, height: 5)
            actionView.layer.shadowRadius = 5
            actionView.delegate = self
        }
    }
    @IBOutlet weak var actionViewBottom: NSLayoutConstraint!
    var animated: Bool = false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNaviBar()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShown(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHidden(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    private func setupNaviBar(){
        let backButton: UIBarButtonItem = UIBarButtonItem(image: R.image.left()!.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(self.tappedBackFn))
        self.navigationItem.setLeftBarButtonItems([backButton], animated: true)
        let button = UIButton(type: UIButtonType.custom)
        button.layer.backgroundColor = mainColor.cgColor
        button.layer.cornerRadius = 8.0
        button.setTitle(toukou, for: .normal)
        button.setTitle(toukou, for: .highlighted)
        button.titleLabel?.font = UIFont(name: hiragonoW6, size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedCompletedFn), for: .touchUpInside)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 5
        let completeButton: UIBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.setRightBarButtonItems([completeButton], animated: true)
        self.navigationController?.navigationBar.tintColor = mainColor
    }
    
    func keyboardWillShown(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, !self.animated {
                self.animated = true
                self.actionView.layer.removeAllAnimations()
                UIView.animate(withDuration: 0.3, animations: {
                    self.actionView.actionButton.transform = CGAffineTransform(rotationAngle: CGFloat(45 * CGFloat.pi / 180))
                    self.actionViewBottom.constant = keyboardRect.height + 25
                    self.actionView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                })
            }
        }
    }
    
    func keyboardWillHidden(notification: NSNotification) {
        if self.animated {
            self.animated = false
            UIView.animate(withDuration: 0.3, animations: {
                self.actionViewBottom.constant = 25
                self.actionView.actionButton.transform = CGAffineTransform(rotationAngle: CGFloat(90 * CGFloat.pi / 180))
                self.actionView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
    
    func tappedSaveButton() {
        self.textView.resignFirstResponder()
    }
    
    func tappedCompletedFn() {
        self.textView.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    func tappedBackFn() {
        self.textView.resignFirstResponder()
        var buttons: [DefaultButton] = []
        let pv = PopupDialogDefaultView.appearance()
        pv.messageColor = UIColor.black
        pv.messageFont = UIFont(name: hiragonoW6, size: 12)!
        let message = leaveText
        buttons.append(DefaultButton(title: deleteText) {
            self.dismiss(animated: true, completion: nil)
        })
        let popup = PopupDialog(title: title, message: message)
        buttons.append(DefaultButton(title: draftText) {
            self.dismiss(animated: true, completion: nil)
        })
        popup.addButtons(buttons)
        self.present(popup, animated: true, completion: nil)
    }
}

extension LogNewViewController: PlusActionDelegate {
    func tappedButton(_ button: UIButton){
        if !self.animated {
            self.textView.becomeFirstResponder()
        } else {
            self.textView.resignFirstResponder()
        }
    }
}

extension LogNewViewController: UITextViewDelegate {
    
}
