//
//  ThirdViewController.swift
//  TransparentNavigationController
//
//  Created by i.varfolomeev on 10/11/2019.
//  Copyright © 2019 i.varfolomeev. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(frame: .init(x: 25, y: 240, width: 100, height: 100))
        button.backgroundColor = .blue
        button.setTitle("Pop to 2", for: .normal)
        button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
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
        title = "third"
        view.backgroundColor = .clear
        view.addSubview(button)
    }
    
    @objc func tapOnButton() {
        navigationController?.popViewController(animated: true)
    }
}
