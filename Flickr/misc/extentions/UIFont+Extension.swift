//
//  UIFont+Extension.swift
//  Flickr
//
//  Created by mac on 4/10/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import Foundation
import UIKit

enum FontType: String {
    case regular = "SFProRounded-Regular"
    case ultralight = "SFProRounded-Ultralight"
    case thin = "SFProRounded-Thin"
    case light = "SFProRounded-Light"
    case medium = "SFProRounded-Medium"
    case semibold = "SFProRounded-Semibold"
    case bold = "SFProRounded-Bold"
    case heavy = "SFProRounded-Heavy"
    case black = "SFProRounded-Black"

    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

extension UIFont {
    
    static func medium(_ size: CGFloat) -> UIFont {
        return FontType.medium.of(size: size)
    }

    static func ultralight(_ size: CGFloat) -> UIFont {
        return FontType.ultralight.of(size: size)
    }
    
    static func thin(_ size: CGFloat) -> UIFont {
        return FontType.thin.of(size: size)
    }
    
    static func semibold(_ size: CGFloat) -> UIFont {
        return FontType.semibold.of(size: size)
    }
    
    static func regular(_ size: CGFloat) -> UIFont {
        return FontType.regular.of(size: size)
    }

    static func bold(_ size: CGFloat) -> UIFont {
        return FontType.bold.of(size: size)
    }

    static func black(_ size: CGFloat) -> UIFont {
        return FontType.black.of(size: size)
    }

    static func light(_ size: CGFloat) -> UIFont {
        return FontType.light.of(size: size)
    }

    static func heavy(_ size: CGFloat) -> UIFont {
        return FontType.heavy.of(size: size)
    }
}


