//
//  BouncableCollectionCell.swift
//  
//
//  Created by Andrei Krotov on 13/05/2023.
//

import UIKit

open class BouncableCollectionCell: UICollectionViewCell, BouncableType {

    // MARK: - Open properties

    open var defaultShadowOpacity = Float()
    open var bounceScale: CGFloat = 0.95

    // MARK: - Animation

    open func viewToScale() -> UIView {
        self
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        guard isUserInteractionEnabled else { return }

        animateScaling(isBounced: true)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        guard isUserInteractionEnabled else { return }

        animateScaling(isBounced: false)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        guard isUserInteractionEnabled else { return }

        animateScaling(isBounced: false)
    }
}



