//
//  User.swift
//  BentoBoxBuilder
//
//  Created by Marie S on 2024-09-04.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from:fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
        // ^^ could be an empty account image
    }
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Bugs Bunny", email: "test@email.com")
}
