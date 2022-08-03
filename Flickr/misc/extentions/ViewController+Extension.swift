//
//  ViewController+Extension.swift
//  Flickr
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 NiKa. All rights reserved.
//


import UIKit


private var dataAssociationKey: UInt8 = 0
private var controllerKeyAssociationKey: UInt8 = 1
private var forcedByNavigationManagerAssociationKey: UInt8 = 2

extension UIViewController {
    var data: Any? {
        get {
            return objc_getAssociatedObject(self, &dataAssociationKey) as Any?
        }
        set(newValue) {
            objc_setAssociatedObject(self, &dataAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    var controllerKey: ControllerKey? {
        get {
            return objc_getAssociatedObject(self, &controllerKeyAssociationKey) as? ControllerKey
        }
        set(newValue) {
            objc_setAssociatedObject(self, &controllerKeyAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    var forcedByNavigationManager: Bool {
        get {
            let value = objc_getAssociatedObject(self, &forcedByNavigationManagerAssociationKey) as? NSNumber

            return (value?.boolValue)!
        }
        set(newValue) {
            objc_setAssociatedObject(self, &forcedByNavigationManagerAssociationKey,
                                     NSNumber(value: newValue as Bool), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func isModal() -> Bool {
        return self.presentingViewController?.presentedViewController == self
            || (self.navigationController != nil && self.navigationController?.presentingViewController?.presentedViewController == self.navigationController)
            || self.tabBarController?.presentingViewController is UITabBarController
    }
}

