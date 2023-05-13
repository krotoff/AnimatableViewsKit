//
//  BouncableButton.swift
//  
//
//  Created by Andrei Krotov on 13/05/2023.
//

import UIKit

private protocol BouncableButtonType: UIButton, BouncableType {
    var defaultColor: UIColor { get set }
    var highlightedColor: UIColor { get set }
}

extension BouncableButtonType {

    func scalingAnimationBlock(isBounced: Bool) {
        let scaleTransform = isBounced ? CGAffineTransform(scaleX: bounceScale, y: bounceScale) : .identity
        let shadowOpacity = isBounced ? 0.1 : defaultShadowOpacity

        transform = scaleTransform
        backgroundColor = isBounced ? highlightedColor : defaultColor

        guard layer.shadowOpacity != shadowOpacity else { return }

        layer.shadowOpacity = shadowOpacity
    }
}

open class BouncableButton: UIButton, BouncableButtonType {

    // MARK: - Open properties

    open var defaultColor: UIColor = .clear
    open var highlightedColor: UIColor = .clear
    open var defaultShadowOpacity = Float()
    open var bounceScale: CGFloat = 0.9

    // MARK: - Animation

    open func viewToScale() -> UIView {
        self
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        animateScaling(isBounced: true)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        animateScaling(isBounced: false)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        animateScaling(isBounced: false)
    }
}

