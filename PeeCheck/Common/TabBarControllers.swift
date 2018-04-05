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
    case home
    case chart
    case account
    
    func localized() -> String {
        switch self {
        case .home:
            return "tab_home".localized()
        case .chart:
            return "tab_charts".localized()
        case .account:
            return "tab_account".localized()
        }
    }
    
    func getImageName() -> String {
        switch self {
        case .home:
            return "picto_record"
        case .chart:
            return "tab_picto".localized()
        case .account:
            return "tab_picto".localized()
        }
    }
    
    func getViewController() -> UIViewController {
        switch self {
        case .home:
            return RecordingViewController()
        case .chart:
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
        switch TabBarControllers.home {
        case .home:
            tabControllers.append(.home)
            fallthrough
        case .chart:
            tabControllers.append(.chart)
            fallthrough
        case .account:
            tabControllers.append(.account)
        }
        return tabControllers
    }
}
// swiftlint:enable fallthrough
