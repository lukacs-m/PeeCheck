//
//  TabBarControllers.swift
//  MicturitionCheck
//
//  Created by Martin Lukacs on 06/03/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Foundation
import UIKit
import SwiftIcons
import ChameleonFramework

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
    
    /// Return the image associated with the current value of TabBarControllers
    ///
    /// - Parameter selected: Boolean taht determinates the state of image
    /// - Returns: The  image to display in the tabbar
    func getImage(selected: Bool = false) -> UIImage {
        switch self {
        case .record:
            return UIImage.init(icon: .fontAwesome(.microphone), size: CGSize(width: 22, height: 22), textColor: selected ? FlatSkyBlue() : FlatGreen())
        case .charts:
            return UIImage.init(icon: .fontAwesome(.barChart), size: CGSize(width: 22, height: 22), textColor: selected ? FlatSkyBlue() : FlatGreen())
        case .account:
            return UIImage.init(icon: .fontAwesome(.user), size: CGSize(width: 22, height: 22), textColor: selected ? FlatSkyBlue() : FlatGreen())
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
    
    func shouldBeInNavigation() -> Bool {
        switch self {
        case .record:
            return false
        case .charts:
            return false
        case .account:
            return true
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
