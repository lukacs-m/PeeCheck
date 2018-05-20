//
//  RealmManagerTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 19/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class UserRealmManagerTests: QuickSpec {
    
    override func spec() {
        
        // MARK: - Subject to test
        var sut: UserRealmManager!
        
        beforeSuite {
            sut = UserRealmManager()
        }
        
        afterSuite {
           _ = GeneralRealmManager().deleteData()
        }
        
        describe("UserRealmManager Tests") {
            
            context("Should be able to save the user on device") {
                it("Should save a user") {
                    let result = sut.saveUser(24, .men)
                    expect(result.user).to(beAKindOf(User.self))
                    expect(sut.getUser().user).to(beAKindOf(User.self))
                }
            }

            context("Should be able to get user informations") {
                
                it("Should fetch user") {
                    let result = sut.getUser()
                    expect({
                        guard result.user != nil else {
                            return .failed(reason: "Should have a user")
                        }
                        
                        return .succeeded
                    }).to(succeed())
   
                    expect(result.user?.age) == 24
                    expect(result.user?.gender) == .men
                }
            }
            
            context("Should be able to update the user on device") {
                it("Should save a user") {
                    let result = sut.updateUser(46, .woman)
                    expect(result.user).to(beAKindOf(User.self))
                    expect(sut.getUser().user?.age) == 46
                    expect(sut.getUser().user?.gender) == .woman
                }
            }
        }
    }
}
