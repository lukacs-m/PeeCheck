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
    convenience init(duration: Int, isNight: Bool = false) {
        self.init()
        self.duration = duration
        self.isNight = isNight
    }
    
    // MARK: - Persisted Properties
    @objc dynamic var id = UUID().uuidString //swiftlint:disable:this identifier_name
    @objc dynamic var duration = 0
    @objc dynamic var timestamp = Date().dateTruncated(from: .hour) ?? Date()
    @objc dynamic var isNight = false
    
    // MARK: - Meta
    override static func primaryKey() -> String? {
        return "id"
    }
}
