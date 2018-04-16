//
//  TabBarControllers.swift
//  MicturitionCheck
//
//  Created by Martin Lukacs on 06/03/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import UIKit

/// Enum containing the tabbar controllers
///
/// - home: Main TabBar page
/// - chart: User charts
/// - account: User account controller
enum TabBarControllers: String {
    case record
    case charts
    case account
    
    /// Return the localized name associated with the current value of TabBarControllers
    ///
    /// - Returns: A string containing the localized name associated with the current value of TabBarControllers
    func localized() -> String {
        switch self {
        case .record:
            return "tab_record".localized()
        case .charts:
            return "tab_charts".localized()
        case .account:
            return "tab_account".localized()
        }
    }
    
    /// Return the image name associated with the current value of TabBarControllers
    ///
    /// - Returns: The name of the image to display in the tabbar
    func getImageName() -> String {
        switch self {
        case .record:
            return "picto_record"
        case .charts:
            return "tab_picto".localized()
        case .account:
            return "tab_picto".localized()
        }
    }
    
    /// Return a viewController associated with the current value of TabBarControllers
    ///
    /// - Returns: ViewController to display in tabbar
    func getViewController() -> UIViewController {
        switch self {
        case .record:
            return RecordingViewController()
        case .charts:
            return UIViewController()
        case .account:
            return UIViewController()
        }
    }
}

// MARK: - Extension to generate arry containing enum information
// swiftlint:disable fallthrough
extension TabBarControllers {
    static var array: [TabBarControllers] {
        var tabControllers: [TabBarControllers] = []
        switch self.record {
        case .record:
            tabControllers.append(.record)
            fallthrough
        case .charts:
            tabControllers.append(.charts)
            fallthrough
        case .account:
            tabControllers.append(.account)
        }
        return tabControllers
    }
}
// swiftlint:enable fallthrough
