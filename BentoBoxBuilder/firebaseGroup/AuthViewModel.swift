//
//  AuthViewModel.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isAuthenticated = true
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func initialize() async {
        await fetchUser()
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch {
            print("failed to login \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // backend sign out
            self.userSession = nil
            self.currentUser = nil
        }catch {
            print("Failed to sign out with error \(error.localizedDescription)")
            
        }
    }
    
  
    
    func deleteAccount()  {
       
    }
        
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
          
            if let data = snapshot.data() {
                self.currentUser = try? Firestore.Decoder().decode(User.self, from: data)
                print("DEBUG: Current user is \(String(describing: self.currentUser))")
            } else {
                print("DEBUG: No user data found")
            }
        } catch {
            print("DEBUG: Error fetching user: \(error.localizedDescription)")
        }
    }}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        
        return ProfileView()
            .environmentObject(viewModel)
    }
}
