//
//  main.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 17/04/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass? = NSClassFromString("PeeCheckTests.TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)), nil, NSStringFromClass(appDelegateClass!))
