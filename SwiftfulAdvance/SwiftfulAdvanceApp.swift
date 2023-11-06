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
        let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        self.currentUserIsSignedIn = userIsSignedIn
    }
    
    var body: some Scene {
        WindowGroup {
            UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
        }
    }
}
