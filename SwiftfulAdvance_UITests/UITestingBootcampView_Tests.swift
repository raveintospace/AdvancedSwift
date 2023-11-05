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

    // reference to our app
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false

        // launch our app to run ui test
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"intro\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        keyA.tap()
        
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"intro\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_UITestingBootcampView_showAlertButton_shouldDisplayAlert() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        keyA.tap()
        
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"intro\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        
        //Then
        XCTAssertTrue(alert.exists)
    }
    
    func test_UITestingBootcampView_showAlertButton_shouldDisplayAndDismissAlert() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        keyA.tap()
        
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"intro\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
        let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOKButtonExists)
        
        alertOKButton.tap()
        
        let alertExists = alert.waitForExistence(timeout: 5)
        
        // Then
        XCTAssertFalse(alertExists)
        XCTAssertFalse(alert.exists)
    }

}
