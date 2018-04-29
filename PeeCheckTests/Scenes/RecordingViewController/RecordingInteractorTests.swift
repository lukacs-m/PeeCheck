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

@testable import PeeCheck
import XCTest

//class RecordingInteractorTests: XCTestCase
//{
//  // MARK: Subject under test
//  
//  var sut: RecordingInteractor!
//  
//  // MARK: Test lifecycle
//  
//  override func setUp()
//  {
//    super.setUp()
//    setupRecordingInteractor()
//  }
//  
//  override func tearDown()
//  {
//    super.tearDown()
//  }
//  
//  // MARK: Test setup
//  
//  func setupRecordingInteractor()
//  {
//    sut = RecordingInteractor()
//  }
//  
//  // MARK: Test doubles
//  
//  class RecordingPresentationLogicSpy: RecordingPresentationLogic
//  {
//    var presentSomethingCalled = false
//    
//    func presentSomething(response: Recording.Something.Response)
//    {
//      presentSomethingCalled = true
//    }
//  }
//  
//  // MARK: Tests
//  
//  func testDoSomething()
//  {
//    // Given
//    let spy = RecordingPresentationLogicSpy()
//    sut.presenter = spy
//    let request = Recording.Something.Request()
//    
//    // When
//    sut.doSomething(request: request)
//    
//    // Then
//    XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
//  }
//}
