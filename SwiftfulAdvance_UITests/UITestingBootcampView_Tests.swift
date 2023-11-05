//
//  UITestingBootcampView_Tests.swift
//  SwiftfulAdvance_UITests
//  https://youtu.be/RoDUYFuNeJU?si=rILag8gGqKZ026ci - Lesson 18
//  Created by Uri on 5/11/23.
//

import XCTest

/*
 Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior -> test_movieViewModel_pagesEnded_shouldBeTrue()
 
 Naming structure: test_[struct]_[ui compoment]_[expected result]
 
 Testing structure: Given - When - Then
 */

final class UITestingBootcampView_Tests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

        // launch our app to run ui test
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        
    }

}
