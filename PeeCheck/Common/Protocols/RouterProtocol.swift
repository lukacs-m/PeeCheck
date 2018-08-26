//
//  RouterProtocol.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 10/06/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    /**
     Creates and returns a storyboard object for the specified storyboard resource file in the main bundle of the current application.
     
     - parameter name: The name of the storyboard resource file without the filename extension.
     
     - returns: A storyboard object for the specified file. If no storyboard resource file matching name exists, an exception is thrown.
     */
    convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
}
