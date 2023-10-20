//
//  RegisterView.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                LoginHeader(title: "SwiftTodo", subtitle: "Create Your Account", angle: -15, background: .orange)
                
                // Login Form
                Form{
                    TextField("Your Name" , text: $registerViewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Your Email" , text: $registerViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Your Password" , text: $registerViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    MyButton(
                        title: "Create Account",
                        backgroundColor: .pink,
                        textColor: .white,
                        action: {
                            registerViewModel.register()
                    })
                }
                .offset(y: -50)
                
                Spacer()

            }
        }
    }
}

#Preview {
    RegisterView()
}
