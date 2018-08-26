//
//  AccountModels.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 30/04/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Account {
    // MARK: Use cases
    
    enum FetchUser {
        struct Request {
        }
        struct Response {
            var user: User?
            var error: PersistenceErrors?
        }
        struct ViewModel {
            var user: User?
            var error: PersistenceErrors?
        }
    }
    
    enum DeleteUser {
        struct Request {
        }
        
        struct Response {
            var error: PersistenceErrors?
        }
        
        struct ViewModel {
            var error: PersistenceErrors?
        }
    }
}