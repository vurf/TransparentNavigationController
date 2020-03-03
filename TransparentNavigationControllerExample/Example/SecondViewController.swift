//
//  SecondViewController.swift
//  TransparentNavigationController
//
//  Created by i.varfolomeev on 10/11/2019.
//  Copyright © 2019 i.varfolomeev. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    lazy var buttonPush: UIButton = {
        let button = UIButton(frame: .init(x: 25, y: 440, width: 300, height: 50))
        button.backgroundColor = .blue
        button.setTitle("Push to 3", for: .normal)
        button.addTarget(self, action: #selector(tapOnButtonPush), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonPop: UIButton = {
        let button = UIButton(frame: .init(x: 225, y: 240, width: 100, height: 50))
        button.backgroundColor = .blue
        button.setTitle("Pop to 1", for: .normal)
        button.addTarget(self, action: #selector(tapOnButtonPop), for: .touchUpInside)
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
        title = "second"
        view.backgroundColor = .clear
        view.addSubview(buttonPush)
        view.addSubview(buttonPop)
    }
    
    @objc func tapOnButtonPush() {
        let viewController = ThirdViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func tapOnButtonPop() {
        navigationController?.popViewController(animated: true)
    }
}
