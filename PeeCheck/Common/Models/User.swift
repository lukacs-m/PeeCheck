//
//  User.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

enum Gender: String {
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

class User: Object {
    @objc dynamic var age = 0
    @objc private dynamic var privateGender = Gender.men.rawValue
    var gender: Gender {
        get { return Gender(rawValue: privateGender) ?? Gender.men }
        set { privateGender = newValue.rawValue }
    }
    // MARK: - Init
    convenience init(_ age: Int, _ gender: Gender) {
        self.init()
        self.age = age
        self.gender = gender
    }
}
