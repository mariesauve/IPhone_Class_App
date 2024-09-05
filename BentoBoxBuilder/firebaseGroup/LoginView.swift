//
//  LoginView.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//
import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    //    @State private var phone = "" <- for an extra form
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("firebase")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                //Form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder:  "name@email.com")
                    .autocapitalization(.none)
                    VStack(spacing: 24) {
                        //                        InputView(text: $password,
                        //                                  title: "Password",
                        //                                  placeholder:  "Enter your password",
                        //                                  .isSecureField: true)
                    }
                    VStack(spacing: 24) {
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder:  "Enter your password")
                        
                        
                    }}
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack{
                        Text("Sign In")
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
                
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 14))
                }
                
            }
        }
    }
}
protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}
    
    extension LoginView: AuthenticationFormProtocol {
        var formIsValid: Bool {
            return !email.isEmpty
            && email.contains("@")
            && !password.isEmpty
            && password.count > 5
       
        }
    }



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        
        LoginView()
            .environmentObject(viewModel)
    }
}
