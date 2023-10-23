//
//  MatchedGeometryEffectBootcamp.swift - Perfect animations
//  SwiftfulAdvance
//  https://youtu.be/Jyh65AMRqzQ?si=yoBqK8qjqd5biJyk
//  Created by Uri on 23/10/23.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    
    // property for our matched geometry effect
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
            }
                
            // basic animation
                //.offset(y: isClicked ? UIScreen.main.bounds.height * 0.75 : 0)
            // also try circle instead of rectangle
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectExample2()
    }
}

struct MatchedGeometryEffectExample2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "categoryBackground", in: namespace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 15)
                    }
                    
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
