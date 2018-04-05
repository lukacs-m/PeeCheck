//
//  String + Extensions.swift
//  MicturitionCheck
//
//  Created by Martin Lukacs on 06/03/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation

extension String {

    ///
    /// Get Localized string with comment
    /// - parameter comment: comment's NSLocalizedString
    /// - returns: Localized string
    ///
    public func localized(_ comment: String = "", _ tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: value, comment: comment)
    }
}
