//
//  ChartsWorkerTests.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 05/08/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Quick
import Nimble
@testable import PeeCheck

class ChartsWorkerTests: QuickSpec {
    
    override func spec() {
        describe("ChartsWorker tests") {
            
            // MARK: Subject under test
            
            var sut: ChartsWorker!
            
            beforeSuite {
                setupChartsWorker()
            }
            
            func setupChartsWorker() {
                sut = ChartsWorker()
            }
            
            // MARK: Tests
            
            context("User creation") {
                it("Sould return a user if no error occured") {
                    let results = sut.getChartsViews()
                    expect(results.count) == 2
                    expect(results["main"]).to(beAKindOf(AccountViewController.self))
                    expect(results["charts"]).to(beAKindOf(AccountViewController.self))
                }
            }
        }
    }
}
