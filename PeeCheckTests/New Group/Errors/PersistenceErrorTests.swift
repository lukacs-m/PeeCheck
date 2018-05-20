//
//  PersistenceErrorTests.swift
//  PeeCheckTests
//
//  Created by Martin Lukacs on 16/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import Quick
import Nimble
@testable import PeeCheck

class PersistenceTests: QuickSpec {
    
    override func spec() {
        
        describe("PersistenceErrors enum Test") {
           
            //MARK: - Test of .couldNotSaveUser enum value
            context("It should validate .couldNotSaveUser value functions") {
                
                it("Should have the good localized .couldNotSaveUser name") {
                    expect(PersistenceErrors.couldNotSaveUser.localized()) == "could_not_save_user_error".localized()
                }
            }
            
            //MARK: - Test of .couldNotFetchUser enum value
            context("It should validate .couldNotFetchUser value functions") {
                
                it("Should have the good localized .couldNotFetchUser name") {
                    expect(PersistenceErrors.couldNotFetchUser.localized()) == "could_not_fetch_user_error".localized()
                }
            }
            
            //MARK: - Test of .couldNotDeleteData enum value
            context("It should validate .couldNotDeleteData value functions") {
                
                it("Should have the good localized .couldNotDeleteData name") {
                    expect(PersistenceErrors.couldNotDeleteData.localized()) == "could_not_delete_data_error".localized()
                }
            }
            
            //MARK: - Test of .couldNotSaveMicturition enum value
            context("It should validate .couldNotSaveMicturition value functions") {
                
                it("Should have the good localized .couldNotSaveMicturition name") {
                    expect(PersistenceErrors.couldNotSaveMicturition.localized()) == "could_not_save_micturition_error".localized()
                }
            }
            
            //MARK: - Test of .couldNotFetchMicturitions enum value
            context("It should validate .couldNotFetchMicturitions value functions") {
                
                it("Should have the good localized .couldNotFetchMicturitions name") {
                    expect(PersistenceErrors.couldNotFetchMicturitions.localized()) == "could_not_fetch_micturition_error".localized()
                }
            }
        }
    }
}

