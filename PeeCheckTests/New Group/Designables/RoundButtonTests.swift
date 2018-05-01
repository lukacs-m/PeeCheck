//
//  RoundButton.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 25/04/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class RoundButtonTests: QuickSpec {
    
    override func spec() {
        describe("RoundButton Test") {
            
            it("should have corner radius equal to half frame height") {
                let roundButton = RoundButton()
                roundButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                roundButton.roundButton = true
                expect(roundButton.layer.cornerRadius) == roundButton.frame.height/2
            }
            
            it("should not have corner radius equal to half frame height") {
                let roundButton = RoundButton()
                roundButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                roundButton.roundButton = false
                expect(roundButton.layer.cornerRadius) != roundButton.frame.height/2
                expect(roundButton.layer.cornerRadius) == 0
            }
            
            it("should have corner radius equal when prepared for interface builder called") {
                let roundButton = RoundButton()
                roundButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                roundButton.roundButton = true
                roundButton.prepareForInterfaceBuilder()
                expect(roundButton.layer.cornerRadius) == roundButton.frame.height/2
            }
        }
    }
}
