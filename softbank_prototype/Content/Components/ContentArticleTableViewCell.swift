//
//  ContentArticleTableViewCell.swift
//  softbank_prototype
//
//  Created by Apple on 2018/08/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import Toaster

protocol  ContentArticleTableViewCellDelegate: class {
    func noticeDidLoad()
}

class ContentArticleTableViewCell: UITableViewCell {
    weak var delegate: ContentArticleTableViewCellDelegate!
    @IBOutlet weak var webView: UIWebView! {
        didSet {
            webView.scrollView.isScrollEnabled = false
            webView.delegate = self
        }
    }
    @IBOutlet weak var webViewHeight: NSLayoutConstraint!
    
    func setData() {
        
        guard let URL = URL(string: ("https://lifedata1.com/change-of-pace-133/").addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!) else {
            Toast(text: "Urlの取得に失敗しました").show()
            return
        }
        webView.loadRequest(NSURLRequest(url: URL) as URLRequest )
        self.webViewHeight.constant = CGFloat(3000)
        //let defaults = UserDefaults.standard
        //let html = defaults.object(forKey: "AI-HTML") as! String
//        self.webView.loadHTMLString("<html><head><style type=\"\">body{font-family:\'ヒラギノ角ゴ Pro W3\';}</style></head><body>" + html +
//            "</body></html>", baseURL: nil)
    }
}
extension ContentArticleTableViewCell: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        guard let output = webView.stringByEvaluatingJavaScript(from: "document.documentElement.clientHeight;"),
        let height = Int(output) else {
            fatalError("cant get height")
        }
        self.webViewHeight.constant = CGFloat(3000)
        self.delegate?.noticeDidLoad()
    }
}
