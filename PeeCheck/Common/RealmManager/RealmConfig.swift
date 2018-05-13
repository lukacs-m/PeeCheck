//
//  RealmConfig.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 13/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmConfig {
    
    // MARK: - private configurations
    private static let mainConfig = Realm.Configuration(
        schemaVersion: 1
    )
    
    // MARK: - enum cases
    case main
    
    // MARK: - current configuration
    var configuration: Realm.Configuration {
        switch self {
        case .main:
            return RealmConfig.mainConfig
        }
    }
}

