//
//  ButtonStyleBootcamp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 22/10/23.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
    }
}

extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        VStack(spacing: 15) {
            Button {
                debugPrint("Button clicked")
            } label: {
                Text("Click me")
                    .withDefaultButtonFormatting()
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
            }
            .buttonStyle(PressableButtonStyle(scaledAmount: 0.5))
            
            Button {
                debugPrint("Button clicked")
            } label: {
                Text("Click me")
                    .withDefaultButtonFormatting(backgroundColor: .red)
                    .shadow(color: Color.red.opacity(0.3), radius: 10, x: 0.0, y: 10)
            }
            .withPressableStyle()
            
            Button {
                debugPrint("Button clicked")
            } label: {
                Text("Click me")
                    .font(.headline)
                    .withDefaultButtonFormatting(backgroundColor: .green)
                    .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0.0, y: 10)
            }
            .withPressableStyle(scaledAmount: 1.2)
        }
        .padding(40)
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
