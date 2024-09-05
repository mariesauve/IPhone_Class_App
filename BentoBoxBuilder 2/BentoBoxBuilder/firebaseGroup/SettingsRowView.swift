//
//  SettingsRowView.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack (spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
}
