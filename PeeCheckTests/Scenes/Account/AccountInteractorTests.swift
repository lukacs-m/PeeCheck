//
//  AccountInteractorTests.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Quick
import Nimble
@testable import PeeCheck

class AccountInteractorTests: QuickSpec {
    
    override func spec() {
        describe("AccountInteractor tests") {
            
            // MARK: Subject under test
            
            var sut: AccountInteractor!
            
            beforeSuite {
                setupAccountInteractor()
            }
            
            // MARK: Test setup
            
            func setupAccountInteractor() {
                sut = AccountInteractor()
            }
            
            // MARK: Test doubles
            
            class AccountPresentationLogicSpy: AccountPresentationLogic
            {
                var presentUserCalled = false
                var presentDeletedUserCalled = false
                
                func presentUser(response: Account.FetchUser.Response) {
                    presentUserCalled = true
                }
                
                func presentDeletedUser(response: Account.DeleteUser.Response) {
                    presentDeletedUserCalled = true
                }
            }
            
            // MARK: Tests
            
            context("Check User") {
                it("Should call the present user") {
                    let spy = AccountPresentationLogicSpy()
                    sut.presenter = spy
                    let request = Account.FetchUser.Request()
                    
                    sut.fetchUser(request: request)
                    expect(spy.presentUserCalled).to(beTrue())
                }
            }
            
            context("Check deleting user") {
                it("Should call the present delete user") {
                    let spy = AccountPresentationLogicSpy()
                    sut.presenter = spy
                    let request = Account.DeleteUser.Request()
                    
                    sut.deleteUser(request: request)
                    expect(spy.presentDeletedUserCalled).to(beTrue())
                }
            }
            
        }
    }
}
