//
//  ViewBuilderBootcamp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 27/10/23.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// Content = T
struct HeaderViewGeneric<Content: View>: View {
    
    let title: String
    let content: Content
    
    // content is a function () that returns a generic conforming to View
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Type: View>: View {
    
    let customContent: Type
    
    init(@ViewBuilder content: () -> Type) {
        self.customContent = content()
    }
    
    var body: some View {
        HStack {
            customContent
        }
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New title", description: "Hello", iconName: "heart.fill")
            
            HeaderViewRegular(title: "Second title", description: nil, iconName: nil)
            
            HeaderViewGeneric(title: "Generic title") {
                HStack {
                    Text("Hi")
                    Image(systemName: "bolt")
                    Text("Power")
                }
            }
            
            CustomHStack {
                Text("Hello")
                Text("Hello")
            }
            
            HStack {
                Text("Hello")
                Text("Hello")
            }
            
            Spacer()
        }
    }
}

struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        // ViewBuilderBootcamp()
        LocalViewBuilder(type: .three)
    }
}

// app looks according case of ViewType
struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
        
        /*
        if type == .one {
            viewOne
        } else if type == .two {
            viewTwo
        } else if type == .three {
            viewThree
        }
         */
    }
    
    private var viewOne: some View {
        Text("One!")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("Twooo")
            Image(systemName: "heart")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "bolt")
    }
}
