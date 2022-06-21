//
//  UserModel.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/17/22.
//

import Foundation

class UserModel: Codable {
    
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case first_name = "first_name"
        case last_name = "last_name"
        case avatar = "avatar"
    }
    
}
