//
//  TabBarControllersTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 16/04/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class TabBarControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("TabBarControllers enum Test") {
            
            it("should contain 3 controllers") {
                expect(TabBarControllers.array.count) == 3
            }
            
            //MARK: - Test of .record enum value
            context("It should validate .record value functions") {
                it("Should be a RecordingViewController") {
                    expect(TabBarControllers.record.getViewController()).to(beAKindOf(RecordingViewController.self))
                }
                
                it("Should have the good record image name") {
                    expect(TabBarControllers.record.getImageName()) == "picto_record"
                }
                
                it("Should have the good localized record name") {
                    expect(TabBarControllers.record.localized()) == "tab_record".localized()
                }
            }
            
            //MARK: - Test of .account enum value
            context("It should validate .charts value functions") {
                it("Should be a UIViewController") {
                    expect(TabBarControllers.charts.getViewController()).to(beAKindOf(UIViewController.self))
                }
                
                it("Should have the good chart image name") {
                    expect(TabBarControllers.charts.getImageName()) == "picto_tab"
                }
                
                it("Should have the good localized record name") {
                    expect(TabBarControllers.charts.localized()) == "tab_charts".localized()
                }
            }
            
            //MARK: - Test of .account enum value
            context("It should validate .account value functions") {
                it("Should be a UIViewController") {
                    expect(TabBarControllers.account.getViewController()).to(beAKindOf(UIViewController.self))
                }
                
                it("Should have the good record image name") {
                    expect(TabBarControllers.account.getImageName()) == "picto_tab"
                }
                
                it("Should have the good localized record name") {
                    expect(TabBarControllers.account.localized()) == "tab_account".localized()
                }
            }
        }
    }
}
