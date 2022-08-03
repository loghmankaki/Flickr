//
//  state.swift
//  Flickr
//
//  Created by mac on 3/24/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import Foundation

enum State {
    case unknown, loading, success, error

    static func == (left: State, right: State) -> Bool {
        switch (left, right) {
        case (.unknown, .unknown):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}
