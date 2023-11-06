//
//  SwiftfulAdvanceApp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 22/10/23.
//

import SwiftUI

@main
struct SwiftfulAdvanceApp: App {
    
    let currentUserIsSignedIn: Bool
    
    init() {
        // Arguments Passed On Launch
        let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        self.currentUserIsSignedIn = userIsSignedIn
        
        /*
        Environment Variables
        let value = ProcessInfo.processInfo.environment["-UITest_startSignedIn2"]
        let userIsSignedInTwo: Bool = value == "true" ? true : false
        self.currentUserIsSignedIn = userIsSignedInTwo
        */
    }
    
    var body: some Scene {
        WindowGroup {
            UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
        }
    }
}
