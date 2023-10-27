//
//  GenericsBootcamp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 27/10/23.
//

import SwiftUI

struct StringModel {
    
    let info: String?
    
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

struct BoolModel {
    
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        return BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    
    let info: T?
    
    func removeInfo() -> GenericModel {
        return GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "Hi, world!")
    @Published var genericBoolModel = GenericModel(info: false)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

// Generic that conforms to a protocol (View)
struct GenericView<T: View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            content
            Text(title)
        }
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var viewModel = GenericsViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            GenericView(content: Text("Custom Content"), title: "New view")
            
            Divider()
                .background(Color.black)
            
            Text(viewModel.stringModel.info ?? "No string")
            Text(viewModel.boolModel.info?.description ?? "No boolean")
            
            Divider()
                .background(Color.black)
            
            Text(viewModel.genericStringModel.info ?? "No string")
            Text(viewModel.genericBoolModel.info?.description ?? "No boolean")
            
        }
        .onTapGesture {
            viewModel.removeData()
        }
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}
