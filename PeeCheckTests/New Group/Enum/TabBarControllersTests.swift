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
                expect(TabBarControllers.allCases.count) == 3
            }
            
            //MARK: - Test of .record enum value
            context("It should validate .record value functions") {
                it("Should be a RecordingViewController") {
                    expect(TabBarControllers.record.getViewController()).to(beAKindOf(RecordingViewController.self))
                }
                
                it("Should have the good recording image") {
                    expect(TabBarControllers.record.getImage()).to(beAKindOf(UIImage.self))
                }
                
                it("Should have the good localized record name") {
                    expect(TabBarControllers.record.localized()) == "tab_record".localized()
                }
            }
            
            //MARK: - Test of .charts enum value
            context("It should validate .charts value functions") {
                it("Should be a UIViewController") {
                    expect(TabBarControllers.charts.getViewController()).to(beAKindOf(UIViewController.self))
                }
                
                it("Should have the good charts image") {
                    expect(TabBarControllers.charts.getImage()).to(beAKindOf(UIImage.self))
                }
                
                it("Should have the good localized charts name") {
                    expect(TabBarControllers.charts.localized()) == "tab_charts".localized()
                }
            }
            
            //MARK: - Test of .account enum value
            context("It should validate .account value functions") {
                it("Should be a UIViewController") {
                    expect(TabBarControllers.account.getViewController()).to(beAKindOf(UIViewController.self))
                }
                
                it("Should have the good account image") {
                    expect(TabBarControllers.account.getImage()).to(beAKindOf(UIImage.self))
                }
                
                it("Should have the good localized account name") {
                    expect(TabBarControllers.account.localized()) == "tab_account".localized()
                }
            }
        }
    }
}
