//
//  PostDesign.swift
//  Social Feed
//
//  Created by Louis on 21/10/2016.
//  Copyright © 2016 Wepro Co. Ltd. All rights reserved.
//

import UIKit

class PostDesign: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 0 , height: 1.0)
    }

}
