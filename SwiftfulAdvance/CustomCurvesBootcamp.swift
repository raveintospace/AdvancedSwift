//
//  CustomCurvesBootcamp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 24/10/23.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            QuadSample()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
            
            ArcSample()
                .frame(width: 150, height: 150)
                .foregroundColor(.yellow)
                .rotationEffect(Angle(degrees: 90))
            
            ShapeWithArc()
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: 180))
            
            // edit > format > show colors > drag color
            WaterShape()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1234931496, green: 0.2665864599, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.103423202, green: 1, blue: 0.9095236314, alpha: 1))]),
                        startPoint: .leading,
                        endPoint: .trailing))
                .ignoresSafeArea()
        }
    }
}

struct CustomCurvesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurvesBootcamp()
    }
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: -20),
                        endAngle: Angle(degrees: 20),
                        clockwise: true)
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            // bottom
            // path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY - 50),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
            
            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.maxX - 50, y: rect.minY - 30))
        }
    }
}

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.75))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
