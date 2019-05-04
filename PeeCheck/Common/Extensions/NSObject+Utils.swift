//
//  NSObject+Utils.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 23/04/2019.
//  Copyright © 2019 Martin Lukacs. All rights reserved.
//

import Foundation

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

