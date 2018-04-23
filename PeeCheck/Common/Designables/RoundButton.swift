//
//  RoundButton.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 22/04/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height/2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height/2
        }
    }
}
