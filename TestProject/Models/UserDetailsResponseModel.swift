//
//  UserDetailsResponseModel.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/20/22.
//

import Foundation

struct UserDetailsResponseModel: Codable {

    let data: UserModel
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
