//
//  ViewController.swift
//  TransparentNavigationController
//
//  Created by i.varfolomeev on 10/11/2019.
//  Copyright © 2019 i.varfolomeev. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    lazy var buttonPush: UIButton = {
        let button = UIButton(frame: .init(x: 25, y: 440, width: 320, height: 50))
        button.backgroundColor = .blue
        button.setTitle("Push to 2", for: .normal)
        button.addTarget(self, action: #selector(tapOnButtonPush), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first"
        view.backgroundColor = .clear
        view.addSubview(buttonPush)
    }
    
    @objc func tapOnButtonPush() {
        let viewController = SecondViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

