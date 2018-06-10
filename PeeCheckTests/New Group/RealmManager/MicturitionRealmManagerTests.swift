//
//  MicturitionRealmManagerTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 20/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class MicturitionRealmManagerTests: QuickSpec {
    
    override func spec() {
        
        // MARK: - Subject to test
        var sut: MicturitionRealmManager!
        
        beforeSuite {
            sut = MicturitionRealmManager()
        }
        
        afterSuite {
            _ = GeneralRealmManager().deleteData()
        }
        
        describe("MicturitionRealmManager Tests") {
            
            context("Should be able to save the micturition on device") {
                it("Should save a micturition") {
                    let micturition = Micturition(duration: 10)
                    expect( sut.saveMicturition(micturition: micturition)).to(beNil())
                    expect(sut.getMicturitions().micturitions?.count) == 1
                }
                
                it("Should save second micturition") {
                    let micturition = Micturition(duration: 10)
                    expect(sut.saveMicturition(micturition: micturition)).to(beNil())
                    expect(sut.getMicturitions().micturitions?.count) == 2
                }
            }
            
            context("Should be able to get micturition informations") {
                
                it("Should fetch micturitions") {
                    let result = sut.getMicturitions()
                    expect({
                        guard result.micturitions != nil else {
                            return .failed(reason: "Should have a micturition")
                        }
                        
                        return .succeeded
                    }).to(succeed())
                    
                    expect(result.micturitions?.count) == 2
                    expect(result.micturitions?[0].duration) == 10
                }
            }
        }
    }
}
