//
//  CustomViews.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 18/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

class RoundShadowView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 6
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 6
    }
}

class HeroImage : UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        makeCircleFromView()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
    }
}

