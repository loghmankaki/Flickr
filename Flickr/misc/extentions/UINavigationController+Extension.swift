//
//  UINavigationController+Extension.swift
//  Flickr
//
//  Created by mac on 6/4/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import UIKit

extension UINavigationController {

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = self.viewControllers.last {
            return topViewController.preferredStatusBarStyle
        }
        return super.preferredStatusBarStyle
    }

    func popViewController(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    func pushViewController(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
}
