//
//  CreateUserInteractorTests.swift
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

class CreateUserInteractorTests: QuickSpec {
    
    override func spec() {
        describe("CreateUserInteractor tests") {
            
            // MARK: Subject under test
            
            var sut: CreateUserInteractor!
            var userFields = CreateUser.UserFields(age: 24, gender: .woman)
            
            beforeSuite {
                setupCreateUserInteractor()
            }
            
            // MARK: Test setup
            
            func setupCreateUserInteractor() {
                sut = CreateUserInteractor()
            }
            
            // MARK: Test doubles
            
            class CreateUserPresentationLogicSpy: CreateUserPresentationLogic
            {
                var presentUserToEditCalled = false
                var presentUserAgeCalled = false
                var presentCreateUserCalled = false

                func presentUserToEdit(response: CreateUser.EditUser.Response) {
                    presentUserToEditCalled = true
                }
                
                func presentUserAge(response: CreateUser.UserAge.Response) {
                    presentUserAgeCalled = true
                }
                
                func presentCreateUser(response: CreateUser.CreateUser.Response) {
                    presentCreateUserCalled = true
                }
            }
            
            // MARK: Tests
            
            context("Check User Edit") {
                
                it("Sould call the presentUserToEdit function") {
                    let spy = CreateUserPresentationLogicSpy()
                    sut.presenter = spy
                    let request = CreateUser.EditUser.Request()
                    
                    sut.showUserToEdit(request: request)
                    expect(spy.presentUserToEditCalled).to(beFalse())
                }
                
                it("Sould call the presentUserToEdit function") {
                    let spy = CreateUserPresentationLogicSpy()
                    sut.presenter = spy
                    sut.userToEdit = User(25, .men)
                    let request = CreateUser.EditUser.Request()
                    
                    sut.showUserToEdit(request: request)
                    expect(spy.presentUserToEditCalled).to(beTrue())
                }
            }
            
            context("Check user age") {
                it("Sould call the present user age function") {
                    let spy = CreateUserPresentationLogicSpy()
                    sut.presenter = spy
                    let request = CreateUser.UserAge.Request()
                    
                    sut.checkUserAge(request: request)
                    expect(spy.presentUserAgeCalled).to(beTrue())
                }
            }
            
            context("Check user age") {
                it("Sould call the present user age function") {
                    let spy = CreateUserPresentationLogicSpy()
                    sut.presenter = spy
                    let request = CreateUser.CreateUser.Request(userFormFields: userFields)
                    
                    sut.createUser(request: request)
                    expect(spy.presentCreateUserCalled).to(beTrue())
                }
                
                it("Sould fill up user to edit") {
                    let request = CreateUser.CreateUser.Request(userFormFields: userFields)
                    sut.createUser(request: request)
                    expect(sut.userToEdit).toNot(beNil())
                    expect(sut.userToEdit?.age) == 24
                    expect(sut.userToEdit?.gender) == .woman
                }
            }
        }
    }
}
