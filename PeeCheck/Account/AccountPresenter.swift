//
//  AccountPresenter.swift
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

protocol AccountPresentationLogic {
    func presentUser(response: Account.FetchUser.Response)
    func presentDeletedUser(response: Account.DeleteUser.Response)
}

class AccountPresenter: AccountPresentationLogic {
    weak var viewController: AccountDisplayLogic?
    
    // MARK: Present user information
    
    func presentUser(response: Account.FetchUser.Response) {
        let viewModel = Account.FetchUser.ViewModel(user: response.user, error: response.error)
        viewController?.displayUserInformation(viewModel: viewModel)
    }
    
    func presentDeletedUser(response: Account.DeleteUser.Response) {
        let viewModel = Account.DeleteUser.ViewModel(error: response.error)
        viewController?.displayDeletedUserInformation(viewModel: viewModel)
    }
}
