//
//  ShadowView.swift
//  Messiah App
//
//  Created by Thomas Martin on 11/17/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        let SHADOW_COLOR: CGFloat = 0.0 / 255.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
    }

}
