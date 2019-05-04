//
//  MicturitionRealmManager.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 20/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

protocol MicturitionPersistenceInjected { }

struct MicturitionRealmInjector {
    static var persistenceManager: MicturitionDataManager = MicturitionRealmManager()
}

extension MicturitionPersistenceInjected {
    var micturitionDataManager: MicturitionDataManager {
        get { return MicturitionRealmInjector.persistenceManager }
        set { MicturitionRealmInjector.persistenceManager = newValue }
    }
}

protocol MicturitionDataManager: class {
    func saveMicturition(micturition: Micturition) -> PersistenceErrors?
    func getMicturitions() -> (micturitions: RealmSwift.Results<Micturition>?, error: PersistenceErrors?)
}

class MicturitionRealmManager: MicturitionDataManager {
    
    func saveMicturition(micturition: Micturition) -> PersistenceErrors? {
        do {
            let realm = try Realm(configuration: RealmConfig.getConfig())
            
            try realm.write {
                realm.add(micturition)
            }
            return nil
        } catch {
            return PersistenceErrors.couldNotSaveMicturition
        }
    }
    
    func getMicturitions() -> (micturitions: RealmSwift.Results<Micturition>?, error: PersistenceErrors?) {
        do {
            let realm = try Realm(configuration: RealmConfig.getConfig())
            let micturitions = realm.objects(Micturition.self)
            return (micturitions, nil)
        } catch {
            return (nil, PersistenceErrors.couldNotFetchMicturitions)
        }
    }
}
