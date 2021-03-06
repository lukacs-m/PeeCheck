//
//  ChartsInteractorTests.swift
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

class ChartsInteractorTests: QuickSpec {
    
    override func spec() {
        describe("ChartsInteractor tests") {
            
            // MARK: Subject under test
            
            var sut: ChartsInteractor!
            
            beforeSuite {
                setupChartsInteractor()
            }
            
            // MARK: Test setup
            
            func setupChartsInteractor() {
                sut = ChartsInteractor()
            }
            
            // MARK: Test doubles
            
            class ChartsPresentationLogicSpy: ChartsPresentationLogic {
                
                var presentFetchChartsViewsCalled = false
                
                func presentFetchChartsViews(response: Charts.FetchChartsViews.Response) {
                    presentFetchChartsViewsCalled = true
                }
            }
            
            // MARK: Tests
            
            context("Set Up SplitView") {
                
                it("Sould call the presentFetchChartsViews function") {
                    let spy = ChartsPresentationLogicSpy()
                    sut.presenter = spy
                    let request = Charts.FetchChartsViews.Request()
                    
                    sut.fetchChartsViews(request: request)
                    expect(spy.presentFetchChartsViewsCalled).to(beTrue())
                }
            }
        }
    }
}
