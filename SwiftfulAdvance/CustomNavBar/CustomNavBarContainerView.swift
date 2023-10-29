//
//  CustomNavBarContainerView.swift
//  SwiftfulAdvance
//
//  Created by Uri on 29/10/23.
//

import SwiftUI

// Content is a generic!
struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    // properties that will observe our PreferenceKeys
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    @State private var showBackButton: Bool = true
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(title: title, subtitle: subtitle, showBackButton: showBackButton)
            content
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: {
            value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self, perform: {
            value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: {
            value in
            self.showBackButton = !value    // opposite of hidden
        })
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello, World!")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationSubtitle("Subtitle")
                    .customNavigationBarBackButtonHidden(false)
            }            
        }
    }
}
