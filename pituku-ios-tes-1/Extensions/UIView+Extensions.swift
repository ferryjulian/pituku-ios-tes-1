//
//  UIView+Extensions.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 06/11/23.
//

import Foundation
import UIKit

extension UIEdgeInsets {
    public init(padding: CGFloat) {
        self.init(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    public init(verticalPadding: CGFloat = 0.0, horizontalPadding: CGFloat = 0.0) {
        self.init(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    @inlinable public static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top + rhs.top, left: lhs.left + rhs.left, bottom: lhs.bottom + rhs.bottom, right: lhs.right + rhs.right)
    }
    
    @inlinable public static func += (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs.top += rhs.top
        lhs.left += rhs.left
        lhs.bottom += rhs.bottom
        lhs.right += rhs.right
    }
}

extension UIView {
    func setCornerRadius(_ radius: CGFloat = 16.0) {
        self.layer.cornerRadius = radius
    }
    
    // TODO: Make it proper
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func gradientBackground(
        from firstColor: UIColor,
        to secondColor: UIColor,
        startLoc: NSNumber = 0.0,
        endLoc: NSNumber = 1.0
    ) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [startLoc, endLoc]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: .zero)
    }
}
