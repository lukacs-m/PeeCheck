//
//  RoundedCornerButtonTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class RoundedCornerButtonTests: QuickSpec {
    
    override func spec() {
        describe("RoundedCornerButton enum Test") {

            it("should have corner radius equal to raduis variable") {
                let roundedButton = RoundedCornerButton()
                roundedButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                roundedButton.radius = 5
                expect(roundedButton.layer.cornerRadius) == 5
            }
            
            it("should have corner radius equal when prepared for interface builder called") {
                let roundedButton = RoundedCornerButton()
                roundedButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                roundedButton.radius = 5
                roundedButton.prepareForInterfaceBuilder()
                expect(roundedButton.layer.cornerRadius) == 5
            }
        }
    }
}

