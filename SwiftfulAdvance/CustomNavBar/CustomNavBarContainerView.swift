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
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView()
            content
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello, World!")
                    .foregroundColor(.white)
            }            
        }
    }
}
