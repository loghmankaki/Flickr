//
//  BaseVM.swift
//  Flickr
//
//  Created by mac on 3/24/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import Foundation

class BaseVM {
    private(set) var state = Observable(State.unknown)

    func setState(_ state: State) {
        self.state.value = state
    }
   
    
}
