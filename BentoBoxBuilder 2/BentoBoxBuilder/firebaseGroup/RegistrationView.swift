//
//  RegistrationView.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Image("firebase")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .padding(.vertical, 32)
        
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder:  "name@email.com")
                .autocapitalization(.none)
                
                  InputView(text: $fullname,
                              title: "fullname",
                              placeholder:  "Enter your fullname")
              
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder:  "Enter your password")
           
                ZStack (alignment: .trailing) {

                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder:  "Confirm your password")
                       
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                            }else {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                            }
                      }
                }}
          .padding(.horizontal)
          .padding(.top, 12)
            
            Button {
                Task{
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
            } label: {
                HStack{
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            Spacer()
            Button{
                dismiss()
            }label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
             }
                .font(.system(size: 14))            }
        }
    }
}

    
    extension RegistrationView: AuthenticationFormProtocol {
        var formIsValid: Bool {
            return !email.isEmpty
            && email.contains("@")
            && !password.isEmpty
            && password.count > 5
            && confirmPassword == password
            && !fullname.isEmpty
        }
    }
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel() // Initialize the AuthViewModel
        
        RegistrationView()
            .environmentObject(viewModel) // Provide the environment object
    }
}
