//
//  aaViewController.swift
//  QYUtilCore
//
//  Created by cyd on 2020/8/19.
//

import UIKit

open class QYViewController: UIViewController {

    public var viewModel: QYViewModel?
    public init(viewModel: QYViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupConfig()
        registerNotification()
        setupUI()
        setupTheme()
        bindViewModel()
    }
    open func setupConfig() {
        
    }
    open func registerNotification() {}
    open func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
    }
    open func setupTheme() {
        view.backgroundColor = QYColor.backgroundColor
    }
    open func bindViewModel() {}
}

