//
//  RecordingInteractorTests.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 17/04/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Quick
import Nimble
@testable import PeeCheck

class RecordingInteractorTests: QuickSpec {
    
    override func spec() {
        describe("RecordingInteractor tests") {
            
            // MARK: Subject under test
            
            var sut: RecordingInteractor!
            
            beforeSuite {
                setupRecordingInteractor()
            }
            
            // MARK: Test setup
            
            func setupRecordingInteractor() {
                sut = RecordingInteractor()
            }
            
            // MARK: Test doubles
            
            class RecordingPresentationLogicSpy: RecordingPresentationLogic
            {
                var presentSetSwitchCalled = false
                var presentRecordMicturitionCalled = false
                
                func presentSetSwitch(response: Recording.SetSwitch.Response) {
                    presentSetSwitchCalled = true
                }
                
                func presentRecordMicturition(response: Recording.RecordMicturition.Response) {
                    presentRecordMicturitionCalled = true
                }
            }
            
            // MARK: Tests
            
            context("Check time") {
                it("Should call the present switch function") {
                    let spy = RecordingPresentationLogicSpy()
                    sut.presenter = spy
                    let request = Recording.SetSwitch.Request()
                    
                    sut.checkTime(request: request)
                    expect(spy.presentSetSwitchCalled).to(beTrue())
                }
            }
            
            context("Check recording") {
                it("Should call the present recording function") {
                    let spy = RecordingPresentationLogicSpy()
                    sut.presenter = spy
                    let request = Recording.RecordMicturition.Request()
                    
                    sut.recordMicturition(request: request)
                    expect(spy.presentRecordMicturitionCalled).to(beTrue())
                }
            }

        }
    }
}
