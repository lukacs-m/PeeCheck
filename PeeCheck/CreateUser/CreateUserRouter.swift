//
//  CreateUserRouter.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol CreateUserRoutingLogic {
    func routeToAccount()
}

protocol CreateUserDataPassing {
    var dataStore: CreateUserDataStore? { get }
}

class CreateUserRouter: NSObject, CreateUserRoutingLogic, CreateUserDataPassing {
    
    weak var viewController: CreateUserViewController?
    var dataStore: CreateUserDataStore?
    
    func routeToAccount() {
        guard let destinationVC = viewController?.navigationController?.viewControllers.first(where: { $0 is AccountViewController }) as? AccountViewController
            else {
                // Show order not in stack so push fresh
                let destinationVC = AccountViewController(nibName: "AccountViewController", bundle: nil)
                var destinationDS = destinationVC.router!.dataStore!
                self.passDataToAccount(source: self.dataStore!, destination: &destinationDS)
                viewController!.navigationController?.pushViewController(destinationVC, animated: true)
                return
        }
        var destinationDS = destinationVC.router!.dataStore!
        passDataToAccount(source: dataStore!, destination: &destinationDS)
        navigateToAccount(source: viewController!, destination: destinationVC)
    }
}

// MARK: Navigation

extension  CreateUserRouter {
    func navigateToAccount(source: CreateUserViewController, destination: AccountViewController) {
        source.navigationController?.popToViewController(destination, animated: true)
    }
}

// MARK: Passing data

extension  CreateUserRouter {
    func passDataToAccount(source: CreateUserDataStore, destination: inout AccountDataStore) {
        destination.user = source.userToEdit
    }
}