//
//  UIViewController+ExtensionsTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 12/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class UIViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("UIViewController extensions tests") {
            
            // MARK: Subject under test
            
            var sut: UIViewController!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupViewController() {
                sut = UIViewController()
            }
            
            beforeEach {
                super.setUp()
                window = UIWindow(frame: UIScreen.main.bounds)
                setupViewController()
            }
            
            func loadview() {
                window.addSubview(sut.view)
            }
            
            afterEach {
                window = nil
            }
            
            
            //MARK: - Test
            
            context("When view if loaded") {
                it("Should present an alert") {
                    loadview()
                    sut.showAlert("titleTest", message: "subtitle")
                    expect(sut.presentedViewController).toNot(beNil())
                    expect(sut.presentedViewController?.title) == "titleTest"
                    expect(sut.presentedViewController).to(beAKindOf(UIAlertController.self))
                    guard let vc = sut.presentedViewController, let alert = vc as? UIAlertController else { return }
                    expect(alert.message) == "subtitle"
                }
            }
        }
    }
}
