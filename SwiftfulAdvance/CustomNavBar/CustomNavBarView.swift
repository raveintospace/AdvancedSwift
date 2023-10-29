//
//  CustomNavBarView.swift
//  SwiftfulAdvance
//
//  Created by Uri on 29/10/23.
//

import SwiftUI

struct CustomNavBarView: View {
    
    // enables back button as a dismisser
    @Environment(\.presentationMode) var presentationMode
    
    // customizable properties for our NavBar
    let title: String
    let subtitle: String?
    let showBackButton: Bool
    
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
            CustomNavBarView(title: "Title", subtitle: "Subtitle", showBackButton: true)
            Spacer()
        }
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
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
