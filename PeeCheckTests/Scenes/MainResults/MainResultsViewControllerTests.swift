//
//  MainResultsViewControllerTests.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 11/03/2019.
//  Copyright (c) 2019 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import PeeCheck
import XCTest
//
//class MainResultsViewControllerTests: XCTestCase {
//  // MARK: Subject under test
//  
//  var sut: MainResultsViewController!
//  var window: UIWindow!
//  
//  // MARK: Test lifecycle
//  
//  override func setUp() {
//    super.setUp()
//    window = UIWindow()
//    setupMainResultsViewController()
//  }
//  
//  override func tearDown() {
//    window = nil
//    super.tearDown()
//  }
//  
//  // MARK: Test setup
//  
//  func setupMainResultsViewController() {
//    let bundle = Bundle.main
//    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
//    sut = storyboard.instantiateViewController(withIdentifier: "MainResultsViewController") as! MainResultsViewController
//  }
//  
//  func loadView() {
//    window.addSubview(sut.view)
//    RunLoop.current.run(until: Date())
//  }
//  
//  // MARK: Test doubles
//  
//  class MainResultsBusinessLogicSpy: MainResultsBusinessLogic {
//    var doSomethingCalled = false
//    
//    func doSomething(request: MainResults.Something.Request) {
//      doSomethingCalled = true
//    }
//  }
//  
//  // MARK: Tests
//  
//  func testShouldDoSomethingWhenViewIsLoaded() {
//    // Given
//    let spy = MainResultsBusinessLogicSpy()
//    sut.interactor = spy
//    
//    // When
//    loadView()
//    
//    // Then
//    XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
//  }
//  
//  func testDisplaySomething() {
//    // Given
//    let viewModel = MainResults.Something.ViewModel()
//    
//    // When
//    loadView()
//    sut.displaySomething(viewModel: viewModel)
//    
//    // Then
//    //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
//  }
//}
