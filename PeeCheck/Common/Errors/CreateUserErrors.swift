//
//  CreateUserErrors.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 13/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation

enum CreateUserErrors: Error {
    case couldNotSaveUser
    
    func localized() -> String {
        switch self {
        case .couldNotSaveUser:
            return "could_not_save_micturition_error".localized()
        }
    }
}
