//
//  AppTabBarView.swift
//  SwiftfulAdvance
//
//  Created by Uri on 28/10/23.
//  Default Apple TabBarView

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: .red)
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: .red))
            
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: .blue))
            
            Color.orange
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: .orange))
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: .red),
        TabBarItem(iconName: "heart", title: "Favorites", color: .blue),
        TabBarItem(iconName: "person", title: "Profile", color: .orange)
    ]
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
