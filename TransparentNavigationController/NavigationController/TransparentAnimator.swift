//
//  TransparentAnimator.swift
//  TransparentNavigationController
//
//  Created by i.varfolomeev on 10/11/2019.
//  Copyright © 2019 i.varfolomeev. All rights reserved.
//

import Foundation
import UIKit

final class TransparentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum AnimationKind {
        case push, pop
    }
    
    var duration: TimeInterval
    var animationKind: AnimationKind
    
    // MARK: - Init
    
    init(animationKind: AnimationKind) {
        self.duration = 0.250
        self.animationKind = animationKind
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }
        
        let completion = { transitionContext.completeTransition(!transitionContext.transitionWasCancelled) }
        switch animationKind {
        case .push:
            animatePush(containerView, from: fromViewController, to: toViewController, completion: completion )
        case .pop:
            animatePop(containerView, from: fromViewController, to: toViewController, completion: completion)
        }
    }
    
    // MARK: - Private
    
    private func animatePush(_ container: UIView, from: UIViewController, to: UIViewController, completion: @escaping () -> ()) {
        container.addSubview(from.view)
        container.addSubview(to.view)
        
        from.view.center = container.center
        from.view.layer.opacity = 1
        
        to.view.center = CGPoint(x: container.center.x + container.bounds.width, y: container.center.y)
        to.view.layer.opacity = 0
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            
            from.view.center = CGPoint(x: container.center.x - container.bounds.width, y: container.center.y)
            from.view.layer.opacity = 0
            
            to.view.center = container.center
            to.view.layer.opacity = 1
        }) { _ in
            completion()
        }
    }
    
    private func animatePop(_ container: UIView, from: UIViewController, to: UIViewController, completion: @escaping() -> ()) {
        container.addSubview(from.view)
        container.addSubview(to.view)
        
        from.view.center = container.center
        from.view.layer.opacity = 1
        
        to.view.center = CGPoint(x: container.center.x - container.bounds.width, y: container.center.y)
        to.view.layer.opacity = 0
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            
            from.view.center = CGPoint(x: container.center.x + container.bounds.width, y: container.center.y)
            from.view.layer.opacity = 0
            
            to.view.center = container.center
            to.view.layer.opacity = 1
        }) { _ in
            completion()
        }
    }
}
