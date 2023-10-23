//
//  CustomShapesBootcamp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 23/10/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // position initial point
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            
            // draw the lines from initial point to end points
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

struct CustomShapesBootcamp: View {
    var body: some View {
        ZStack {
            Image("Darko")
                .resizable()
                .scaledToFill()
            
//            Triangle()
//                //.fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
//                //.trim(from: 0, to: 0.5)
//                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5]))
//                .foregroundColor(.blue)
                .frame(width: 300, height: 300)
                .clipShape(
                    Triangle()
                        .rotation(Angle(degrees: 180))
                )
            
            // Rectangle()
//                .trim(from: 0, to: 0.5)
//                .frame(width: 200, height: 200)
            // Diamond()
            // Trapezoid()
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange)
        }
    }
}

struct CustomShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBootcamp()
    }
}
