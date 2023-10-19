//
//  LoginView.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        
        NavigationView {
            VStack {
                // Header
                LoginHeader(title: "SwiftTodo", subtitle: "Login to Your Account", angle: 15, background: .pink)
                
                // Login Form
                Form{
                    
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address" , text: $loginViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password" , text: $loginViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    MyButton(
                        title: "Login",
                        backgroundColor: .pink,
                        textColor: .white,
                        action: {
                            loginViewModel.login()
                    })
                }
                .offset(y: -50)
                
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()

            }
        }
    }
}

#Preview {
    LoginView()
}
