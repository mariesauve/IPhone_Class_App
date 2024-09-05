//
//  MainView.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
              // RegistrationView()
               // LoginView()
            } else {
                LoginView()
            }
        }
        .padding()
    }
}
    
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = AuthViewModel()
            MainView()
                .environmentObject(viewModel)
        }
    }

