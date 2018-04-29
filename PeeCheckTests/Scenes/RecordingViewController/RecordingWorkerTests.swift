//
//  RecordingWorkerTests.swift
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

class RecordingWorkerTests: QuickSpec {
    
    override func spec() {
        describe("RecordingWorker tests") {
            
            // MARK: Subject under test
            
            var sut: RecordingWorker!
            
            beforeSuite {
                setupRecordingWorker()
            }
            
            // MARK: Test setup
            
            func setupRecordingWorker() {
                sut = RecordingWorker()
            }
            
            // MARK: Tests
            
            context("Check time") {
                it("Sould return bool depending on time of day") {
                    let time = Calendar.current.component(.hour, from: Date())
                    if time >= 1 && time < 6 {
                        expect(sut.isNightTime()).to(beTrue())
                    } else {
                        expect(sut.isNightTime()).to(beFalse())
                    }
                }
            }
            
            context("Record micturition") {
                it("Sould return bool after saving micturition") {
                    _ = sut.saveMicturitionTime(true)
                    expect(sut.saveMicturitionTime(false)).to(beTrue())
                }
                
                it("Sould return nil at start of timer recording") {
                    expect(sut.saveMicturitionTime(true)).to(beNil())
                }
            }
        }
    }
}
