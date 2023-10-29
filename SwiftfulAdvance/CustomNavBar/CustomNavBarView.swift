//
//  CustomNavBarView.swift
//  SwiftfulAdvance
//
//  Created by Uri on 29/10/23.
//

import SwiftUI

struct CustomNavBarView: View {
    
    // customizable properties for our NavBar
    @State private var showBackButton: Bool = true
    @State private var title: String = "Title" //""
    @State private var subtitle: String? = "Subtitle" //nil
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView()
            Spacer()
        }
        
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
            
        }
    }
}
