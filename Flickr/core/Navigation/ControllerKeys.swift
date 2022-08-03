//
//  ControllerKeys.swift
//  Flickr
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import UIKit

typealias ControllerKey = String

let kControllerMap: [ ControllerKey: (classType: UIViewController.Type, title: String)] =
    [
        ControllerKeys.home.rawValue: (HomeVC.self, ""),
    ]

enum ControllerKeys: ControllerKey {
    case home
}

var kControllerTree: [ControllerKey: (index: Int, iconName: String)] = [:]

var kControllerTreeKeys: [ControllerKey] {
    return kControllerTree.keys.sorted { kControllerTree[$0]!.index < kControllerTree[$1]!.index }
}

var kControllerTreeCenterItem: ControllerKey {
    return kControllerTree.filter({$0.value.index == 1}).first!.0
}
