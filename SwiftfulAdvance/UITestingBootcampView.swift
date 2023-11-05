//
//  UITestingBootcampView.swift
//  SwiftfulAdvance
//
//  Created by Uri on 5/11/23.
//

import SwiftUI

class UITestingBootcampViewModel: ObservableObject {
    
    let placeholderText: String = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var currentUserIsSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
}

struct UITestingBootcampView: View {
    
    @StateObject private var vm = UITestingBootcampViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ZStack {
                if vm.currentUserIsSignedIn {
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                    
                }
                if !vm.currentUserIsSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

struct UITestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingBootcampView()
    }
}

extension UITestingBootcampView {
    
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            
            Button {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct SignedInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcome to your profile"))
                })
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}
