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

        // launch our app to run UI Test
        
        // app.launchArguments = ["-UITest_startSignedIn"] -> Uncomment to test Arguments Passed On Launch
        // app.launchEnvironment = ["-UITest_startSignedIn2" : "true"] -> Uncomment to test Environment Variables
        
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: false)
        
        // When
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_UITestingBootcampView_showAlertButton_shouldDisplayAlert() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: false)
        
        //Then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }
    
    func test_UITestingBootcampView_showAlertButton_shouldDisplayAndDismissAlert() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: true)
        
        // Then
        let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
        XCTAssertFalse(alertExists)
    }
    
    func test_UITestingBootcampView_navigationLinkToDestination_shouldNavigateToDestination() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: false)
        
        // Then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_UITestingBootcampView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: true)
        
        // Then
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
    }
    
    /*
    Uncomment to test Arguments Passed On Launch
    func test_UITestingBootcampView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack2() {
        // Given
        // we don't need signUpAndSignIn because we are already logged in using our argument on launch
        
        // When
        tapNavigationLink(shouldDismissDestination: true)
        
        // Then
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
    }
     */
}


// MARK: - Modular functions

extension UITestingBootcampView_Tests {
    func signUpAndSignIn(shouldTypeOnKeyboard: Bool) {
        let textfield = app.textFields["SignUpTextField"]
        textfield.tap()
        
        if shouldTypeOnKeyboard {
            let keyA = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            keyA.tap()
            
            let keya = app.keys["a"]
            keya.tap()
            keya.tap()
        }
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"intro\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
    
    func tapAlertButton(shouldDismissAlert: Bool) {
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismissAlert {
            let alert = app.alerts.firstMatch
            let alertOKButton = alert.buttons["OK"]
            let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
            XCTAssertTrue(alertOKButtonExists)
            
            alertOKButton.tap()
        }
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        let navLinkButton = app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navLinkButton.tap()
        
        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome"]
            backButton.tap()
        }
    }
}
