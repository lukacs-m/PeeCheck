//
//  GeneralRealmManager.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 20/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

protocol GeneralPersistenceInjected { }

struct GeneralRealmInjector {
    static var persistenceManager: GeneralDataManager = GeneralRealmManager()
}

extension GeneralPersistenceInjected {
    var generalDataManager: GeneralDataManager {
        get { return GeneralRealmInjector.persistenceManager }
        set { GeneralRealmInjector.persistenceManager = newValue }
    }
}

protocol GeneralDataManager: class {
    func deleteData() -> PersistenceErrors?
}

class GeneralRealmManager: GeneralDataManager {
    
    func deleteData() -> PersistenceErrors? {
        do {
            let realm = try Realm(configuration: RealmConfig.getConfig())
            try realm.write {
                realm.deleteAll()
            }
            return nil
        } catch {
            return PersistenceErrors.couldNotDeleteData
        }
    }
}
