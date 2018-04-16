//
//  String + Extensions.swift
//  MicturitionCheck
//
//  Created by Martin Lukacs on 06/03/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation

extension String {
    
    /// Get Localized string with comment
    ///
    /// - Parameters:
    ///   - comment: comment's String
    ///   - tableName: The name of the string's localized table
    ///   - bundle: bundle to focus on
    ///   - value: value to apply to NSLocalizedString
    /// - Returns: Localized string
    public func localized(_ comment: String = "", _ tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: value, comment: comment)
    }
}
