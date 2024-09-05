//
//  BentoBoxBuilderApp.swift
//  BentoBoxBuilder
//
//  Created by user265215 on 8/19/24.
//

import SwiftUI
import SwiftData
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main
struct BentoBoxBuilderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                   //ContentView()
                 MainView()
                    .environmentObject(viewModel)
                    .task {
                        await viewModel.fetchUser()
                    }
                // ExtraView()
                 }
               }
        }
//        .modelContainer(for: DataItem.self)
        
       
    }


