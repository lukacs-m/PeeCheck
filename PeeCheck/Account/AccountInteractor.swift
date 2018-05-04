//
//  AccountInteractor.swift
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

protocol AccountBusinessLogic {
    func fetchUser(request: Account.FetchUser.Request)
    func deleteUser(request: Account.DeleteUser.Request)
}

protocol AccountDataStore {
    var user: User? { get set }
}

class AccountInteractor: AccountBusinessLogic, AccountDataStore {
    var user: User?
    var presenter: AccountPresentationLogic?
    var worker = AccountWorker()
    
    // MARK: Fetch user
    
    func fetchUser(request: Account.FetchUser.Request) {
        let response = Account.FetchUser.Response(user: user != nil ? user : worker.getUser())
        presenter?.presentUser(response: response)
    }
    
    // MARK: Delete user information
    
    func deleteUser(request: Account.DeleteUser.Request) {
        let response = Account.DeleteUser.Response(error: worker.deleteUser())
        presenter?.presentDeletedUser(response: response)
    }
}
