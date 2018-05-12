//
//  UIButton+Extensions.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 03/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setUpMainButtonUI() {
        self.backgroundColor = Style.Color.MainBlue
        self.contentEdgeInsets = Style.Size.ButtonInsets
        self.setTitleColor(.white, for: .normal)
    }
}
