//
//  ChartsViewControllerTests.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 05/08/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Quick
import Nimble
import ChameleonFramework
@testable import PeeCheck

class ChartsViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("ChartsViewController tests") {
            
            // MARK: Subject under test
            
            var sut: ChartsViewController!
            var window: UIWindow!
            
            // MARK: Test setup
            
            func setupChartsViewController() {
                let storyboard = UIStoryboard(name: "ChartsStoryboard")
                let vc = storyboard.instantiateInitialViewController() as! UISplitViewController
                if let nav = vc.viewControllers.first as? UINavigationController, let chartsVC = nav.viewControllers.first as? ChartsViewController {
                    sut = chartsVC
                }
            }
            
            beforeEach {
                super.setUp()
                window = UIWindow(frame: UIScreen.main.bounds)
                setupChartsViewController()
            }
            
            func loadview() {
                window.addSubview(sut.view)
            }
            
            afterEach {
                window = nil
            }
            
            // MARK: Test doubles
            
            class  ChartsBusinessLogicSpy: ChartsBusinessLogic {
                var fetchChartsViewsCalled = false
                
                func fetchChartsViews(request: Charts.FetchChartsViews.Request) {
                    fetchChartsViewsCalled = true
                }
            }
            
            class TableViewSpy: UITableView
            {
                // MARK: Method call expectations
                
                var reloadDataCalled = false
                
                // MARK: Spied methods
                
                override func reloadData()
                {
                    reloadDataCalled = true
                }
            }
            
            
            //            class CreateUserRouterSpy: CreateUserRouter {
            //                // MARK: Method call expectations
            //
            //                var routeToAccountCalled = false
            //
            //                // MARK: Spied methods
            //                override func routeToAccount() {
            //                    routeToAccountCalled = true
            //                }
            //            }
            
            //MARK: - Test
            
            context("When view if loaded") {
                it("Should be a ChartsViewController") {
                    expect(sut).to(beAKindOf(ChartsViewController.self))
                }
                
                it("Should fetch views controllers to display in splitview on start") {
                    let chartsBusinessLogicSpy = ChartsBusinessLogicSpy()
                    sut.interactor = chartsBusinessLogicSpy
                    
                    loadview()
                    
                    expect(chartsBusinessLogicSpy.fetchChartsViewsCalled).to(beTrue())
                }
            }
            
            context("When tableView is loaded") {
                it("Should display view controller") {
                    // Given
                    let tableViewSpy = TableViewSpy()
                    sut.tableView = tableViewSpy
                    
                    let displayViewControllers = [Charts.FetchChartsViews.ViewModel.DisplayedView(name: "test", viewController: UIViewController())]
                    let viewModel = Charts.FetchChartsViews.ViewModel(displayedViewControllers: displayViewControllers)
                    
                    sut.displayChartsView(viewModel: viewModel)
                    
                    expect(tableViewSpy.reloadDataCalled).to(beTrue())
                }
                
                it("Should have one section in tableView") {
                    // Given
                    let tableView = sut.tableView
                    
                    // When
                    let numberOfSections = sut.numberOfSections(in: tableView!)
                    
                    expect(numberOfSections) == 1
                }
                
                it("Should have one rows in section of tableView") {
                    // Given
                    let tableView = sut.tableView
                    
                    let displayViewControllers = [Charts.FetchChartsViews.ViewModel.DisplayedView(name: "test", viewController: UIViewController()),Charts.FetchChartsViews.ViewModel.DisplayedView(name: "test2", viewController: UIViewController())]
                    let viewModel = Charts.FetchChartsViews.ViewModel(displayedViewControllers: displayViewControllers)
                    
                    sut.displayChartsView(viewModel: viewModel)
                    
                    // When
                    let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
                    
                    expect(numberOfRows) == displayViewControllers.count
                }
                
                it("Should be ChartsTableViewCells") {
                    // Given
                    let tableView = sut.tableView
                    
                    let displayViewControllers = [Charts.FetchChartsViews.ViewModel.DisplayedView(name: "test", viewController: UIViewController()),Charts.FetchChartsViews.ViewModel.DisplayedView(name: "test2", viewController: UIViewController())]
                    let viewModel = Charts.FetchChartsViews.ViewModel(displayedViewControllers: displayViewControllers)
                    
                    sut.displayChartsView(viewModel: viewModel)
                    
                    // When
                    let cell = sut.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 1))
                    
                    expect(cell).to(beAKindOf(ChartsTableViewCell.self))
                    
                    cell.setHighlighted(true, animated: true)
                    expect(cell.backgroundColor) == Style.Color.MainBlue
                    cell.setHighlighted(false, animated: true)
                    expect(cell.backgroundColor) == Style.Color.White
                }
                
            }
        }
    }
}
