//
//  AccountRouter.swift
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

@objc protocol AccountRoutingLogic {
    func routeToCreateUser()
}

protocol AccountDataPassing {
    var dataStore: AccountDataStore? { get }
}

class AccountRouter: NSObject, AccountRoutingLogic, AccountDataPassing {
    weak var viewController: AccountViewController?
    var dataStore: AccountDataStore?
    
    // MARK: Routing
    
    func routeToCreateUser() {
        guard let destinationVC = viewController?.navigationController?.viewControllers.first(where: { $0 is CreateUserViewController }) as? CreateUserViewController
            else {
                // Show order not in stack so push fresh
                let destinationVC = CreateUserViewController(nibName: "CreateUserViewController", bundle: nil)
                var destinationDS = destinationVC.router!.dataStore!
                self.passDataToCreateUser(source: self.dataStore!, destination: &destinationDS)
                viewController!.navigationController?.pushViewController(destinationVC, animated: true)
                return
        }
        var destinationDS = destinationVC.router!.dataStore!
        passDataToCreateUser(source: dataStore!, destination: &destinationDS)
        navigateToCreateUser(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToCreateUser(source: AccountViewController, destination: CreateUserViewController) {
        source.navigationController?.popToViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    func passDataToCreateUser(source: AccountDataStore, destination: inout CreateUserDataStore) {
        destination.userToEdit = source.user
    }
}

