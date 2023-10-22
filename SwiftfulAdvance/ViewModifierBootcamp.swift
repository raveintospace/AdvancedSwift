//
//  ViewModifierBootcamp.swift
//  SwiftfulAdvance
//  https://youtu.be/MQl4DlDf_5k?si=tz9ReyKZTAuVgnsn
//  Created by Uri on 22/10/23.
//

import SwiftUI

// option 1
struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

// option 2, using option 1
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .withDefaultButtonFormatting()
                .font(.title)
            
            Text("Hello, Darko!")
                .withDefaultButtonFormatting(backgroundColor: .black)
                .font(.largeTitle)
            
            Text("Hello, SwiftUI!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .red))
                .font(.headline)
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
