import SwiftUI

struct CustomTabBarView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ScrollView {
                VStack(spacing: 2) {
                    ForEach(0..<30) { index in
                         Text("Item \(index)")
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(Color.blue.opacity(0.2))
                             .cornerRadius(10)
                     }
                 }
                 .padding(.horizontal)
                 .padding(.bottom, 50) // Add padding to avoid overlap with tab bar
             }
                    
                    // Custom Tab Bar
                    HStack {
                        Spacer()
                        Button(action: {
                            print("Home tapped")
                        }) {
                            Image(systemName: "house.fill")
                                .font(.system(size: 24))
                        }
                        Spacer()
                        Button(action: {
                            print("Search tapped")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 24))
                        }
                        Spacer()
                        Button(action: {
                            print("Profile tapped")
                        }) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 24))
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white.shadow(radius: 10))
                }
                .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
            struct CustomTabBarView_Previews: PreviewProvider {
                static var previews: some View {
                    CustomTabBarView()
                }
            }
        
