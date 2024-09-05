import SwiftUI
import FirebaseAuth
import Firebase

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {       // Wrap everything in NavigationView
            if let user = viewModel.currentUser {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray2))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullname)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section("Account") {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                        }
                        Button {
                            print("Delete Account")
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                        }
                        Spacer()
                        
                        // Add the NavigationLink inside the NavigationView
                        NavigationLink {
                            ExtraView()
                            //RegistrationView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack {
                                Text("Go to: ")
                                Text("Bento Box")
                                    .fontWeight(.bold)
                            }
                            .font(.system(size: 14))
                        }
                    }
                }
            }
        }
    }
}
    #Preview {
        let viewModel = AuthViewModel()
        return ProfileView()
            .environmentObject(viewModel)
    }

