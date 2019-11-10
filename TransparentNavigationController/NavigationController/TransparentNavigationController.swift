//
//  TransparentNavigationController.swift
//  TransparentNavigationController
//
//  Created by i.varfolomeev on 10/11/2019.
//  Copyright © 2019 i.varfolomeev. All rights reserved.
//

import Foundation
import UIKit

public final class TransparentNavigationController: UINavigationController {
    
    var interactiveTransition: TransparentInteractiveTransition?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate

extension TransparentNavigationController: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        if let interactiveTransition = interactiveTransition, interactiveTransition.transitionInProgress {
            return interactiveTransition
        }
        
        return nil
    }
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            return TransparentAnimator(animationKind: .push)
        case .pop:
            return TransparentAnimator(animationKind: .pop)
        default:
            return nil
        }
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        interactiveTransition = TransparentInteractiveTransition(attachTo: viewController)
    }
}
