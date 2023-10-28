//
//  TabBarItemsPreferenceKey.swift
//  SwiftfulAdvance
//
//  Created by Uri on 28/10/23.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TabBarItem] = []
    
    // add the new tabBarItem to the array of existing ones
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func tabBarItem(tab: TabBarItem) -> some View {
        self
            .modifier(TabBarItemViewModifier(tab: tab))
    }
}
