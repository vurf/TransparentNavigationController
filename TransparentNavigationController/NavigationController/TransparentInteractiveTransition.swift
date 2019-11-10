//
//  TransparentInteractiveTransition.swift
//  TransparentNavigationController
//
//  Created by i.varfolomeev on 10/11/2019.
//  Copyright © 2019 i.varfolomeev. All rights reserved.
//

import Foundation
import UIKit

class TransparentInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var transitionInProgress: Bool = false
    
    private var shouldCompleteTransition = false
    private let viewController: UIViewController
    
    // MARK: - Init
    
    init(attachTo viewController: UIViewController) {
        self.viewController = viewController
        super.init()
        updateGesture()
    }
    
    // MARK: - Private
    
    private func updateGesture() {
        viewController.view.gestureRecognizers?.removeAll(where: { ($0 as? UIScreenEdgePanGestureRecognizer)?.edges == .left })
        
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        gesture.edges = .left
        viewController.view.addGestureRecognizer(gesture)
    }
    
    @objc private func handlePanGesture(_ gesture: UIScreenEdgePanGestureRecognizer) {
        var progress = gesture.translation(in: viewController.view).x / gesture.view!.bounds.width
        progress = min(1, max(0, progress))
        
        switch gesture.state {
        case .began:
            transitionInProgress = true
            viewController.navigationController?.popViewController(animated: true)
            
        case .changed:
            update(progress)
            shouldCompleteTransition = progress > 0.5
            
        case .cancelled:
            transitionInProgress = false
            cancel()
            
        case .ended:
            transitionInProgress = false
            shouldCompleteTransition ? finish() : cancel()
            
        default:
            break
        }
    }
}
