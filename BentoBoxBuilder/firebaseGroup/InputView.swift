//
//  InputView.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//


import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                
            }else {
                TextField(placeholder, text: $text)
                    .padding(.leading)
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View{
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@email.com")
    }
}
