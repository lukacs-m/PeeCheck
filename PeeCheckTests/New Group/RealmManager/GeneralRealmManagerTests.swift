//
//  GeneralRealmManagerTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 20/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class GeneralRealmManagerTests: QuickSpec {
    
    override func spec() {
        
        // MARK: - Subject to test
        var sut: GeneralRealmManager!
        
        beforeSuite {
            sut = GeneralRealmManager()
        }
        
        afterSuite {
            _ = sut.deleteData()
        }
        
        describe("RealmManager Tests") {
            
            context("Should be able to save the user on device") {
                it("Should save a user") {
                    _ = UserRealmManager().saveUser(24, .men)
                    let micturition = Micturition(duration: 10)
                    _ = MicturitionRealmManager().saveMicturition(micturition: micturition)
                    expect(UserRealmManager().getUser().user).to(beAKindOf(User.self))
                    expect(MicturitionRealmManager().getMicturitions().micturitions?.count) == 1
                    expect(sut.deleteData()).to(beNil())
                    expect(UserRealmManager().getUser().user).to(beNil())
                    expect(MicturitionRealmManager().getMicturitions().micturitions?.count) == 0
                }
            }
            
        }
    }
}
