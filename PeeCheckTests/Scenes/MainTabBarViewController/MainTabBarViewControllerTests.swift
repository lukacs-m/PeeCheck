//
//  MainTabBarViewController.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 17/04/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class MainTabBarViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("MainTabBarViewController tests") {
            
            // MARK: Subject under test
            
            var sut: MainTabBarViewController!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupMainTabBarViewController() {
                sut = MainTabBarViewController()
            }
            
            beforeSuite {
                super.setUp()
                window = UIWindow(frame: UIScreen.main.bounds)
                setupMainTabBarViewController()
            }
            
            afterSuite {
                window = nil
            }
            
            //MARK: - Test
            it("Should be a MainTabBarViewController") {
                expect(sut).to(beAKindOf(MainTabBarViewController.self))
            }
            
            it("Should contain 3 tabBBar items") {
                expect(sut.viewControllers?.count) == 3
            }
            
            it("Should have recordViewController as first and selected item") {
                expect(sut.viewControllers![0]).to(beAKindOf(RecordingViewController.self))
                expect(sut.tabBar.selectedItem?.title) == "tab_record".localized()
            }
        }
    }
    
}
