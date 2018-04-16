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
        }
    }
}
