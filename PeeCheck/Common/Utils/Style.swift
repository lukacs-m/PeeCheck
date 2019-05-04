//
//  Style.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import ChameleonFramework

public enum Style {
    
    // MARK: - Color
    
    public enum Color {
        public static let White = UIColor.white
        public static let MainBlue = FlatSkyBlue()
        public static let MainGreen = FlatGreenDark()
        public static let MainRed = FlatRedDark()
    }
    
    // MARK: - Size
    
    public enum Size {
        public static let ButtonInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
    static func typeOfDevice() -> UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
}
