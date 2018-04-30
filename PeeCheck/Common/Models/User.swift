//
//  User.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation

enum Gender {
    case men
    case woman
    
    func localized() -> String {
        switch self {
        case .men:
            return "men"
        default:
            return "woman"
        }
    }
}

struct User {
    var age: Int?
    var gender: Gender?
    
    init(_ age: Int?, _ gender: Gender?) {
        self.age = age
        self.gender = gender
    }
}
