//
//  NewTabBarView.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-08-29.
//

import SwiftUI

struct NewTabBarView: View {
    var body: some View {
        
        TabView{
            
            VStack{
                Image(systemName: "house")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tabItem {
                        ContentView()
                            .font(.callout)
                        
                    }.padding(.bottom, 10)
                
                Image(systemName: "bell")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
                
        }
      
    }}

#Preview {
    NewTabBarView()
}
