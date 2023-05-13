//
//  BouncableType.swift
//  
//
//  Created by Andrei Krotov on 13/05/2023.
//

import UIKit

public protocol BouncableType: UIView {
    var defaultShadowOpacity: Float { get set }
    var bounceScale: CGFloat { get set }

    func viewToScale() -> UIView
}

extension BouncableType {

    func animateScaling(isBounced: Bool) {
        let timingParams = UISpringTimingParameters(dampingRatio: 10)
        let animator = UIViewPropertyAnimator(duration: 0, timingParameters: timingParams)

        animator.addAnimations {
            self.scalingAnimationBlock(isBounced: isBounced)
        }

        animator.isInterruptible = true
        animator.startAnimation()
    }

    func scalingAnimationBlock(isBounced: Bool) {
        let scaleTransform = isBounced ? CGAffineTransform(scaleX: bounceScale, y: bounceScale) : .identity
        let shadowOpacity = isBounced ? 0.1 : defaultShadowOpacity

        let viewToScale = viewToScale()

        viewToScale.transform = scaleTransform

        guard viewToScale.layer.shadowOpacity != shadowOpacity else { return }

        viewToScale.layer.shadowOpacity = shadowOpacity
    }
}
