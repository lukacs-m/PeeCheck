//
//  UIView+Extensions.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 28/04/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

extension UIView {
    
    func blink(_ shouldBlink: Bool = true) {
        if !shouldBlink {
            self.layer.removeAllAnimations()
            return
        }
        self.alpha = 0.2
        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse, .allowUserInteraction], animations: {self.alpha = 1.0}, completion: nil)
    }
}
