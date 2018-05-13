//
//  RealmManager.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 13/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataManager: class {
    func saveMicturition(micturition: Micturition) -> RecordingErrors?
    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: CreateUserErrors?)
    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: CreateUserErrors?)
    func getUser() -> (user: User?, error: AccountErrors?)
    func getMicturitions() -> Error?
    func deleteData() -> AccountErrors?
}

class RealmManager: DataManager {
    
    func saveMicturition(micturition: Micturition) -> RecordingErrors? {
        do {
            let realm = try Realm(configuration: RealmConfig.main.configuration)
            
            try realm.write {
                realm.add(micturition)
            }
            return nil
        } catch {
            return RecordingErrors.couldNotSaveMicturition
        }
    }
    
    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: CreateUserErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.main.configuration)
            
            let newUser = User(age, gender)
            try realm.write {
                realm.add(newUser)
            }
            return (newUser, nil)
        } catch {
            return (nil, CreateUserErrors.couldNotSaveUser)
        }
    }
    
    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: CreateUserErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.main.configuration)
            let user = realm.objects(User.self).first
            
            if let user = user {
                try realm.write {
                    user.age = age
                    user.gender = gender
                }
            }
            return (user, nil)
        } catch {
            return (nil, CreateUserErrors.couldNotSaveUser)
        }
    }
    
    func deleteData() -> AccountErrors? {
        do {
            let realm = try Realm(configuration: RealmConfig.main.configuration)
            try realm.write {
                realm.deleteAll()
            }
            return nil
        } catch {
            return AccountErrors.couldNotDeleteData
        }
    }
    
    func getUser() -> (user: User?, error: AccountErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.main.configuration)
            let user = realm.objects(User.self).first
            return (user, nil)
        } catch {
            return (nil, AccountErrors.couldFetchUser)
        }
    }
    
    func getMicturitions() -> Error? {
        return nil
    }
}
