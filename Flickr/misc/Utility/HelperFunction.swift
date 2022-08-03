//
//  HelperFunction.swift
//  Flickr
//
//  Created by mac on 4/10/21.
//  Copyright © 2021 NiKa. All rights reserved.
//


import UIKit
import SwiftMessages

func delay(_ time: Double, _ completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        completion()
    }
}

var deviceHasTopNotch: Bool {
    if #available(iOS 11.0, tvOS 11.0, *) {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
    }
    return false
}

func topMsgView(msgTitle: String, msgBody: String,theme:Theme,time:TimeInterval, completion:@escaping (Bool) -> Void) {
    let msgView = MessageView.viewFromNib(layout: .cardView)
    var configView = SwiftMessages.Config()
    msgView.button?.isHidden = true
    msgView.configureTheme(theme)
    msgView.configureContent(title: msgTitle, body: msgBody)
    msgView.configureDropShadow()
    configView.eventListeners.append(){ event in
        if  case .didHide = event {
            completion(true)
        }
    }
    configView.duration = .seconds(seconds: time)
    SwiftMessages.show(config: configView, view: msgView)
}
