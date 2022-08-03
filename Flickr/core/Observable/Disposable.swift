//
//  Disposable.swift
//  Flickr
//
//  Created by mac on 3/24/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import Foundation

public typealias Disposal = [Disposable]

public final class Disposable {
    
    private let dispose: () -> Void
    
    init(_ dispose: @escaping () -> Void) {
        self.dispose = dispose
    }
    
    deinit {
        dispose()
    }
    
    public func add(to disposal: inout Disposal) {
        disposal.append(self)
    }
}
