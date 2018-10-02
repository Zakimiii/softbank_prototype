//
//  HomeNavigationBar.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/02.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol HomeNavigationBarDelegate: class {
    func tappedMenu()
    func tappedChat()
    func animationSearchBar()
    func tappedSearchBar()
}

extension HomeNavigationBarDelegate {
    func tappedMenu(){}
    func tappedChat(){}
    func animationSearchBar(){}
    func tappedSearchBar(){}
}
@objcMembers
class HomeNavigationBar: UINavigationBar {
    @IBOutlet weak var pushNavigationBar: UINavigationBar! {
        didSet {
            pushNavigationBar.tintColor = mainColor
        }
    }
    @IBOutlet weak var chatButton: UIButton! {
        didSet {
            chatButton.setImage(R.image.bell()!.withRenderingMode(.alwaysOriginal).resizedImage(newSize: CGSize(width: 30, height: 24)), for: .normal)
            chatButton.setImage(R.image.bell()!.withRenderingMode(.alwaysOriginal).resizedImage(newSize: CGSize(width: 30, height: 24)), for: .highlighted)
        }
    }
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet weak var searchBar: SearchBar! {
        didSet{
            searchBar.isHidden = true
            searchBar.searchField.isEnabled = false
            searchBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tappedSearchBar)))
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.isHidden = true
        }
    }
    weak var delegating: HomeNavigationBarDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(R.nib.homeNavigationBar.name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func tappedSearchBar(){
        self.delegating?.tappedSearchBar()
    }
    
    func searchEnabled() {
        searchBar.searchField.isEnabled = true
        searchBar.isHidden = false
    }
    
    func disableButton() {
        self.isUserInteractionEnabled = true
        searchBar.isHidden = true
        menuView.isHidden = true
        chatButton.isHidden = true
    }
    
    func enableButton() {
        self.isUserInteractionEnabled = true
        searchBar.isHidden = false
        menuView.isHidden = false
        chatButton.isHidden = false
    }
    
    func initContentView() {
        containerView.isHidden = false
    }
    
    func deinitContentView() {
        containerView.isHidden = true
    }
}
