//
//  CreateUserPresenterTests.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 08/05/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Quick
import Nimble
@testable import PeeCheck

class CreateUserPresenterTests: QuickSpec {
    
    override func spec() {
        describe("CreateUserPresenter tests") {
            
            // MARK: Subject under test
            
            var sut: CreateUserPresenter!
            let user = User(25, .men)
            
            beforeSuite {
                setupCreateUserPresenter()
            }
            
            // MARK: Test setup
            
            func setupCreateUserPresenter() {
                sut = CreateUserPresenter()
            }
            
            // MARK: Test doubles
            
            class CreateUserDisplayLogicSpy: CreateUserDisplayLogic {
          
                var displayUserToEditCalled = false
                var displayUserAgeCalled = false
                var displayCreateUserCalled = false
                var displayUpdateUserCalled = false
                var activateSaveUserButtonCalled = false
                
                func displayUserToEdit(viewModel: CreateUser.EditUser.ViewModel) {
                    displayUserToEditCalled = true
                }
                
                func displayUserAge(viewModel: CreateUser.UserAge.ViewModel) {
                    displayUserAgeCalled = true
                }
                
                func displayCreateUser(viewModel: CreateUser.CreateUser.ViewModel) {
                    displayCreateUserCalled = true
                }
                
                func displayUpdateUser(viewModel: CreateUser.UpdateUser.ViewModel) {
                    displayUpdateUserCalled = true
                }
                
                func activateSaveUserButton(viewModel: CreateUser.ActivateSaveButton.ViewModel) {
                    activateSaveUserButtonCalled = true
                }
            }
            
            // MARK: Tests
            
            context("Display user edit") {
                it("Should call display user to edit function") {
                    let spy = CreateUserDisplayLogicSpy()
                    sut.viewController = spy
                    let response = CreateUser.EditUser.Response(user: user, pickerRow: user.gender.hashValue)
                    
                    sut.presentUserToEdit(response: response)
                    expect(spy.displayUserToEditCalled).to(beTrue())
                }
            }
            
            context("Display user age") {
                it("Should call display user age function") {
                    let spy = CreateUserDisplayLogicSpy()
                    sut.viewController = spy
                    let response = CreateUser.UserAge.Response(age: user.age, valide: true)
                    
                    sut.presentUserAge(response: response)
                    expect(spy.displayUserAgeCalled).to(beTrue())
                }
            }
            
            context("Display user creation") {
                it("Should call display user creation function") {
                    let spy = CreateUserDisplayLogicSpy()
                    sut.viewController = spy
                    let response = CreateUser.CreateUser.Response(user: user, error: nil)
                    
                    sut.presentCreateUser(response: response)
                    expect(spy.displayCreateUserCalled).to(beTrue())
                }
            }
            
            context("Display user update") {
                it("Should call display user update function") {
                    let spy = CreateUserDisplayLogicSpy()
                    sut.viewController = spy
                    let response = CreateUser.UpdateUser.Response(user: user, error: nil)
                    
                    sut.presentUpdateUser(response: response)
                    expect(spy.displayUpdateUserCalled).to(beTrue())
                }
            }
            
            context("Shuold activate the save button") {
                it("Should call display active save button function") {
                    let spy = CreateUserDisplayLogicSpy()
                    sut.viewController = spy
                    let response = CreateUser.ActivateSaveButton.Response(valide: true)
                    
                    sut.presentCheckFormFields(response: response)
                    expect(spy.activateSaveUserButtonCalled).to(beTrue())
                }
            }
        }
    }
}
