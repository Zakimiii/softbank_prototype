//
//  TextFieldCell.swift
//  salomee-ios
//
//  Created by noriki.iwamatsu on 2018/07/03.
//  Copyright © 2018年 Personize Inc. All rights reserved.
//

import UIKit

protocol TextFieldCellDelegate: class {
    func textFieldCellValueEditingChanged(_ cell: TextFieldCell, before: String?)
    func textFieldCellShouldReturn(_ cell: TextFieldCell) -> Bool
    func textFieldCellShouldBeginEditing(_ cell: TextFieldCell) -> Bool
    func textFieldCellDidEndEditing(_ cell: TextFieldCell)
    func textFieldCellTapped(_ cell: TextFieldCell)
}

extension TextFieldCellDelegate where Self: UIViewController {
    func textFieldCellShouldReturn(_ cell: TextFieldCell) -> Bool {
        return true
    }

    func textFieldCellShouldBeginEditing(_ cell: TextFieldCell) -> Bool {
        return true
    }

    func textFieldCellDidEndEditing(_ cell: TextFieldCell) {
    }

    func textFieldCellTapped(_ cell: TextFieldCell) {
    }
}

class TextFieldCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    @IBOutlet weak var borderView: UIView!

    var isEnabled: Bool {
        get {
            return self.textField.isEnabled
        }
        set {
            self.textField.isEnabled = newValue
            self.textField.textColor = newValue
                ? UIColor(red: 0.45, green: 0.62, blue: 0.96, alpha: 1.00)
                : .darkGray
        }
    }

    weak var delegate: TextFieldCellDelegate?
    private var beforeText: String?

    @IBAction func textFieldEditingChanged(_ sender: Any) {
        self.delegate?.textFieldCellValueEditingChanged(self, before: beforeText)
        beforeText = self.textField.text
    }

    @IBAction func cellTapped(_ sender: Any) {
        self.delegate?.textFieldCellTapped(self)
    }
}

extension TextFieldCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.delegate?.textFieldCellShouldReturn(self) ?? true {
            textField.resignFirstResponder()
            return true
        }
        return false
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.delegate?.textFieldCellShouldBeginEditing(self) ?? true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.textFieldCellDidEndEditing(self)
    }
}
