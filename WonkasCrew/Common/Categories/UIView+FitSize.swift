//
//  UIView+FitSize.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import UIKit

extension UIView {
    public func fitSize(widthConstrain width: CGFloat) -> CGSize {
        let targetSize = CGSize(width: width, height: 10000)
        let actualSize = systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriorityRequired, verticalFittingPriority: UILayoutPriorityFittingSizeLevel)
        return actualSize
    }
}
