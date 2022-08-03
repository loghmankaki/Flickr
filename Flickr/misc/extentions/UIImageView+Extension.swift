//
//  UIImageView+Extension.swift
//  Flickr
//
//  Created by mac on 3/24/21.
//  Copyright © 2021 NiKa. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(urlStr: String) {
        let placeHolderImage = #imageLiteral(resourceName: "circle-logo")
        guard let url = URL(string: urlStr) else {
            self.image = placeHolderImage
            return
        }
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.flipFromLeft(0.5)),
                .forceRefresh,
            ], completionHandler: { result in }
        )
    }
}
