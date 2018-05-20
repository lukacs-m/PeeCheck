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
    
    private static var testConfig = Realm.Configuration(
        // Get the URL to the bundled file
        fileURL: Realm.Configuration().fileURL!.deletingLastPathComponent().appendingPathComponent("test.realm"))
    
    // MARK: - enum cases
    case main
    case test
    
    // MARK: - current configuration
    private var configuration: Realm.Configuration {
        switch self {
        case .main:
            return RealmConfig.mainConfig
        case .test:
            return RealmConfig.testConfig
        }
    }
    
   static func getConfig() -> Realm.Configuration {
        if ProcessInfo.processInfo.environment.keys.contains("XCTestConfigurationFilePath") {
            return RealmConfig.test.configuration
        }
        return RealmConfig.main.configuration
    }
}

