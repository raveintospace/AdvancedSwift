//
//  AppNavBarView.swift
//  SwiftfulAdvance
//  Lesson 12 - https://youtu.be/aIDT4uuMLHc?si=9IsbccnAST5xOKki
//  Created by Uri on 29/10/23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        // defaultNavView
        CustomNavBarContainerView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                    })
            }
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(destination: Text("Destination")
                    .navigationTitle("Title 2")
                    .navigationBarBackButtonHidden(false)
                    ,
                    label: {
                        Text("Navigate")
                })
            }
            .navigationTitle("Nav title here")
        }
    }
}
