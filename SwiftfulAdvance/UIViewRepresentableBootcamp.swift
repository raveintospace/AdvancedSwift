//
//  UIViewRepresentableBootcamp.swift
//  SwiftfulAdvance
//  L13 - Convert a UIView from UIKit to SwiftUI
//  Created by Uri on 30/10/23.
//

import SwiftUI

struct UIViewRepresentableBootcamp: View {
    
    @State private var textfieldText: String = ""
    
    var body: some View {
        VStack {
            Text(textfieldText)
            HStack {
                Text("SwiftUI:")
                TextField("Type here", text: $textfieldText)
                    .frame(height: 55)
                .background(Color.gray)
            }
            
            
            HStack {
                Text("UIKit:")
                UITextFieldViewRepresentable(text: $textfieldText)
                    .updatePlaceholder("Different placeholder")
                    .frame(height: 55)
                .background(Color.gray)
            }
        }
        .padding()
    }
}

struct UIViewRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootcamp()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeholderText: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholderText: String = "Default placeholder", placeholderColor: UIColor = .red) {
        self._text = text
        self.placeholderText = placeholderText
        self.placeholderColor = placeholderColor
    }
    
    // create the uikit element
    func makeUIView(context: Context) -> UITextField {
        let textfield = getTextfield()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    private func getTextfield() -> UITextField {
        let textfield = UITextField(frame: .zero)
        
        let placeholder = NSAttributedString(
            string: placeholderText,
            attributes: [
                .foregroundColor : placeholderColor
            ])
        
        textfield.attributedPlaceholder = placeholder
        return textfield
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholderText = text
        return viewRepresentable
    }
    
    // from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    // delegate configuration, from UIKit to SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct basicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
