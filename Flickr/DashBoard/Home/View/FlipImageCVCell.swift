//
//  FlipImageCVCell.swift
//  Flickr
//
//  Created by mac on 8/3/22.
//

import UIKit

class FlipImageCVCell: UICollectionViewCell {
    @IBOutlet weak var ContentView: UIView!{
        didSet{
            ContentView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var imageView: UIView!{
        didSet{
            imageView.isHidden = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var infoView: UIView!{
        didSet{
            infoView.layer.borderColor = UIColor.grey.cgColor
            infoView.layer.borderWidth = 1
            infoView.layer.cornerRadius = 8
            infoView.isHidden = true
            infoView.translatesAutoresizingMaskIntoConstraints = false

        }
    }
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageSize: UILabel!
    @IBOutlet weak var image: UIImageView!{
        didSet{
            image.layer.cornerRadius = 8
        }
    }
    private var isFront = true

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func flip()  {
        if isFront{
            UIView.transition(from: imageView, to: infoView, duration: 0.7, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            isFront = false
        }else{
            UIView.transition(from: infoView, to: imageView, duration: 0.7, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            isFront = true
        }
    }
}
