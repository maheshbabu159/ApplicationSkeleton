//
//  frameworkTests.swift
//  frameworkTests
//
//  Created by apple on 02/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import XCTest
@testable import framework
/*
 https://useyourloaf.com/blog/swift-3-access-controls/
 The Five Access Levels of Swift 3
 Swift 3 has five access levels that control from which source file or module you can access something. In order from most open to most restricted:
 
 open you can access open classes and class members from any source file in the defining module or any module that imports that module. You can subclass an open class or override an open class member both within their defining module and any module that imports that module.
 
 public allows the same access as open - any source file in any module - but has more restrictive subclassing and overriding. You can only subclass a public class within the same module. A public class member can only be overriden by subclasses in the same module. This is important if you are writing a framework. If you want a user of that framework to be able to subclass a class or override a method you must make it open.
 
 internal allows use from any source file in the defining module but not from outside that module. This is generally the default access level.
 
 fileprivate allows use only within the defining source file.
 
 private allows use only from the enclosing declaration.
 
 Note that Objective-C classes and methods are now imported as open.
 */
class frameworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
