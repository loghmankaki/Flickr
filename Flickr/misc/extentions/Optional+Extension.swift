//
//  Optional+Extension.swift
//  Flickr
//
//  Created by mac on 4/10/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import Foundation

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
