//
//  AccountRouterTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 12/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class AccountRouterTests: QuickSpec {
    
    override func spec() {
        describe("AccountRouter tests") {
            
            // MARK: Subject under test
            
            var sut: AccountRouter!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupAccountRouter()
            {
                sut = AccountRouter()
            }
            
            beforeEach {
                super.setUp()
                window = UIWindow(frame: UIScreen.main.bounds)
                setupAccountRouter()
            }
            
            func loadview() {
                let nav = UINavigationController(rootViewController: AccountViewController())
                window?.rootViewController = nav
                window?.makeKeyAndVisible()
            }
            
            afterEach {
                window = nil
            }
            
            // MARK: Test doubles
            
            class AccountDisplayLogicSpy: AccountDisplayLogic {
                var displayUserInformationCalled = false
                var displayDeletedUserInformationCalled = false
                
                func displayUserInformation(viewModel: Account.FetchUser.ViewModel) {
                    displayUserInformationCalled = true
                }
                
                func displayDeletedUserInformation(viewModel: Account.DeleteUser.ViewModel) {
                    displayDeletedUserInformationCalled = true
                }
            }
            
            // MARK: Tests
            
            context("Routing to create user") {
                it("Should display create user page") {
                    loadview()
                    let nav = window.rootViewController as? UINavigationController
                   let accountVC = nav?.topViewController as? AccountViewController
                    
                    accountVC?.router?.routeToCreateUser()
                    expect(accountVC?.navigationController?.viewControllers.count).toEventually(equal(2))
                    expect(accountVC?.navigationController?.topViewController).toEventually(beAKindOf(CreateUserViewController.self))
                }
            }
        }
    }
}
