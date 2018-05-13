//
//  AccountErrors.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 13/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation

enum AccountErrors: Error {
    case couldFetchUser
    case couldNotDeleteData
    
    func localized() -> String {
        switch self {
        case .couldFetchUser:
            return "could_not_save_micturition_error".localized()
        case .couldNotDeleteData:
            return "could_not_save_micturition_error".localized()
        }
    }
}
