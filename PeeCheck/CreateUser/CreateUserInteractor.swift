//
//  CreateUserInteractor.swift
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

protocol CreateUserBusinessLogic {
    var genderTypes: [String] { get }
    var userToEdit: User? { get set }
    func showUserToEdit(request: CreateUser.EditUser.Request)
    func checkUserAge(request: CreateUser.UserAge.Request)
    func createUser(request: CreateUser.CreateUser.Request)
    func updateUser(request: CreateUser.UpdateUser.Request)
    func checkFormFields(request: CreateUser.ActivateSaveButton.Request)
}

protocol CreateUserDataStore {
    var genderTypes: [String] { get }
    var userToEdit: User? { get set }
}

protocol CreateOrderDataStore {
    var shippingMethods: [String] { get }
}

class CreateUserInteractor: CreateUserBusinessLogic, CreateUserDataStore {
    var presenter: CreateUserPresentationLogic?
    var worker = CreateUserWorker()
    var userToEdit: User?
    var genderTypes = [
        Gender.men.localized(),
        Gender.woman.localized()
    ]
    
    // MARK: validate user to edit
    
    func showUserToEdit(request: CreateUser.EditUser.Request) {
        if let userToEdit = userToEdit {
            let response = CreateUser.EditUser.Response(user: userToEdit, pickerRow: userToEdit.gender.hashValue)
            presenter?.presentUserToEdit(response: response)
        }
    }
    
    // MARK: Validate User age
    func checkUserAge(request: CreateUser.UserAge.Request) {
        var valide = false
        var age: Int? = nil
        if let value = request.age, let valideAge = Int(value), valideAge  > 10, valideAge  < 140 {
            age = valideAge
            valide = true
        }
        let response = CreateUser.UserAge.Response(age: age, valide: valide)
        presenter?.presentUserAge(response: response)
    }
    
    // MARK: Validate form fields
    func checkFormFields(request: CreateUser.ActivateSaveButton.Request) {
        var valide = false
        if let value = request.ageField, let valideAge = Int(value), valideAge  > 10, valideAge  < 140, request.genderField != nil {
            valide = true
        }
        let response = CreateUser.ActivateSaveButton.Response(valide: valide)
        presenter?.presentCheckFormFields(response: response)
    }
    
    // MARK: Create new user
    func createUser(request: CreateUser.CreateUser.Request) {
        let results = worker.createUser(request.userFormFields.age, request.userFormFields.gender)
        userToEdit = results.user
        let response = CreateUser.CreateUser.Response(user: userToEdit, error: results.error)
        presenter?.presentCreateUser(response: response)
    }
    
    // MARK: Edit existing user
    func updateUser(request: CreateUser.UpdateUser.Request) {
        let results = worker.updateUser(request.age, request.gender)
        userToEdit = results.user
        let response = CreateUser.UpdateUser.Response(user: userToEdit, error: results.error)
        presenter?.presentUpdateUser(response: response)
    }
}

