//
//  RoundedCornerButton.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit
import ChameleonFramework

@IBDesignable
final class RoundedCornerButton: UIButton {
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if radius > 0 {
            layer.cornerRadius = radius
        }
    }
}
