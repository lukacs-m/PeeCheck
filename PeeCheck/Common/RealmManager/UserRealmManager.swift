//
//  RealmManager.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 13/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

protocol UserPersistenceInjected { }

struct UserRealmInjector {
    static var userPersistenceManager: UserDataManager = UserRealmManager()
}

extension UserPersistenceInjected {
    var userDataManager: UserDataManager {
        get { return UserRealmInjector.userPersistenceManager }
        set { UserRealmInjector.userPersistenceManager = newValue }
    }
}

protocol UserDataManager: class {
    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?)
    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?)
    func getUser() -> (user: User?, error: PersistenceErrors?)
}

class UserRealmManager: UserDataManager {
    
    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.getConfig())
            
            let newUser = User(age, gender)
            try realm.write {
                realm.add(newUser)
            }
            return (newUser, nil)
        } catch {
            return (nil, PersistenceErrors.couldNotSaveUser)
        }
    }
    
    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.getConfig())
            let user = realm.objects(User.self).first
            
            if let user = user {
                try realm.write {
                    user.age = age
                    user.gender = gender
                }
            }
            return (user, nil)
        } catch {
            return (nil, PersistenceErrors.couldNotSaveUser)
        }
    }
    
    func getUser() -> (user: User?, error: PersistenceErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.getConfig())
            let user = realm.objects(User.self).first
            return (user, nil)
        } catch {
            return (nil, PersistenceErrors.couldNotFetchUser)
        }
    }
}
