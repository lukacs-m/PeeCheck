//
//  Micturition.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 13/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import RealmSwift

class Micturition: Object {
    
    // MARK: - Init
    convenience init(duration: Int) {
        self.init()
        self.duration = duration
    }
    
    // MARK: - Persisted Properties
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var duration = 0
    @objc dynamic var timestamp = Date().timeIntervalSinceReferenceDate
    
    // MARK: - Meta
    override static func primaryKey() -> String? {
        return "id"
    }
}
