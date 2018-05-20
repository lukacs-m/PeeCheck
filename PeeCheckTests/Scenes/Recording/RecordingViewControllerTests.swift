//
//  RecordingViewControllerTests.swift
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

class RecordingViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("RecordingViewController tests") {
            
            // MARK: Subject under test
            
            var sut: RecordingViewController!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupRecordingViewController() {
                sut = RecordingViewController()
            }
            
            beforeEach {
                super.setUp()
                window = UIWindow(frame: UIScreen.main.bounds)
                setupRecordingViewController()
            }
            
            func loadview() {
                window.addSubview(sut.view)
            }
            
            afterEach {
                window = nil
            }
            
            // MARK: Test doubles
            
            class RecordingBusinessLogicSpy: RecordingBusinessLogic {                
                var checkTimeCalled = false
                var recordMicturitionCalled = false
                
                func checkTime(request: Recording.SetSwitch.Request) {
                    checkTimeCalled = true
                }
                
                func recordMicturition(request: Recording.RecordMicturition.Request) {
                    recordMicturitionCalled = true
                }
            }
            
            //MARK: - Test
            
            context("When view if loaded") {
                it("Should be a RecordingViewController") {
                    expect(sut).to(beAKindOf(RecordingViewController.self))
                }
                
                it("Should check for time of day and set switch on start") {
                    let recordingBusinessLogicSpy = RecordingBusinessLogicSpy()
                    sut.interactor = recordingBusinessLogicSpy
                    
                    loadview()
                    
                    expect(recordingBusinessLogicSpy.checkTimeCalled).to(beTrue())
                }
            }
            
            context("When recording micturition is called") {
                it("Should start the recording process") {
                    let recordingBusinessLogicSpy = RecordingBusinessLogicSpy()
                    sut.interactor = recordingBusinessLogicSpy
                    
                    sut.recordingAction(UIButton())
                    
                    expect(recordingBusinessLogicSpy.recordMicturitionCalled).to(beTrue())
                }
            }
            
            context("When the awake button is set depending on time of day") {
                it("Shoul have the switch button active") {
                    loadview()
                    let viewModel = Recording.SetSwitch.ViewModel(isNight: true)
                    sut.displaySetSwitch(viewModel: viewModel)
                    
                    expect(sut.switchNightAwake.isOn).to(beTrue())
                }
                
                it("Should have the switch button inactive") {
                    loadview()
                    let viewModel = Recording.SetSwitch.ViewModel(isNight: false)
                    sut.displaySetSwitch(viewModel: viewModel)
                    
                    expect(sut.switchNightAwake.isOn).to(beFalse())
                }
            }
            
            context("When the recording button is set depending on recording status") {
                it("Shoul be blue color & not have animation") {
                    loadview()
                    let viewModel = Recording.RecordMicturition.ViewModel(isRecording: false, error: nil)
                    sut.updateRecordBtnDisplay(viewModel: viewModel)
                    
                    expect(sut.btnRecord.backgroundColor) == Style.Color.MainBlue
                    expect(sut.btnRecord.titleLabel?.text) == "recording_button_title_inactive".localized()
                    expect(sut.btnRecord.layer.animationKeys()).to(beNil())
                }
                
                it("Should be green & have animation") {
                    loadview()
                    let viewModel = Recording.RecordMicturition.ViewModel(isRecording: true, error: nil)
                    sut.updateRecordBtnDisplay(viewModel: viewModel)
                    
                    expect(sut.btnRecord.backgroundColor) == Style.Color.MainGreen
                    expect(sut.btnRecord.titleLabel?.text) == "recording_button_title_active".localized()
                    expect(sut.btnRecord.layer.animationKeys()).toNot(beNil())
                }
            }
        }
    }
}
