//
//  HomePresenter.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import RxSwift
import Foundation

protocol HomePresenterDelegate: class {
}
class HomePresenter: NSObject {
    private let disposeBag = DisposeBag()
    private weak var delegate: HomePresenterDelegate?
    
    init(delegate: HomePresenterDelegate) {
        super.init()
        self.delegate = delegate
    }
}
