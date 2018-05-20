//
//  RealmManagerMock.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 16/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import RealmSwift
@testable import PeeCheck

//class RealmManagerMock: DataManager {
//
//    func saveMicturition(micturition: Micturition) -> PersistenceErrors? {
//        return nil
//    }
//
//    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
//        let newUser = User(age, gender)
//
//        return (newUser, nil)
//    }
//
//    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
//        let user = User(age, gender)
//        return (user, nil)
//
//    }
//
//    func deleteData() -> PersistenceErrors? {
//
//        return nil
//
//    }
//
//    func getUser() -> (user: User?, error: PersistenceErrors?) {
//        let user = User(24, .woman)
//        return (user, nil)
//    }
//
//    func getMicturitions() -> (micturitions: Results<Micturition>?, error: PersistenceErrors?) {
//        do {
//            let realm = try Realm(configuration: RealmConfig.getConfig())
//            let micturitions = realm.objects(Micturition.self)
//            return (micturitions, nil)
//        } catch {
//            return (nil, PersistenceErrors.couldNotFetchMicturitions)
//        }
//    }
//}

class UserRealmManagerMockError: UserDataManager {

    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
        return (nil, PersistenceErrors.couldNotSaveUser)
    }
    
    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
        return (nil, PersistenceErrors.couldNotSaveUser)
    }
    
    func getUser() -> (user: User?, error: PersistenceErrors?) {
        
        return (nil, PersistenceErrors.couldNotFetchUser)
    }
}

//class RealmManagerMockError: DataManager {
//
//    func saveMicturition(micturition: Micturition) -> PersistenceErrors? {
//        return PersistenceErrors.couldNotSaveMicturition
//    }
//
//    func saveUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
//        return (nil, PersistenceErrors.couldNotSaveUser)
//    }
//
//    func updateUser(_ age: Int, _ gender: Gender) -> (user: User?, error: PersistenceErrors?) {
//        return (nil, PersistenceErrors.couldNotSaveUser)
//    }
//
//    func deleteData() -> PersistenceErrors? {
//
//        return PersistenceErrors.couldNotDeleteData
//    }
//
//    func getUser() -> (user: User?, error: PersistenceErrors?) {
//
//        return (nil, PersistenceErrors.couldNotFetchUser)
//    }
//
//    func getMicturitions() -> (micturitions: Results<Micturition>?, error: PersistenceErrors?) {
//
//        return (nil, PersistenceErrors.couldNotFetchMicturitions)
//    }
//}

