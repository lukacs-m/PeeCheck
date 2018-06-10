//
//  PersistenceErrors.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 16/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation

enum PersistenceErrors: Error {
    case couldNotSaveUser
    case couldNotFetchUser
    case couldNotDeleteData
    case couldNotSaveMicturition
    case couldNotFetchMicturitions
    
    func localized() -> String {
        switch self {
        case .couldNotSaveUser:
            return "could_not_save_user_error".localized()
        case .couldNotFetchUser:
            return "could_not_fetch_user_error".localized()
        case .couldNotDeleteData:
            return "could_not_delete_data_error".localized()
        case .couldNotSaveMicturition:
            return "could_not_save_micturition_error".localized()
        case .couldNotFetchMicturitions:
            return "could_not_fetch_micturition_error".localized()
        }
    }
}
