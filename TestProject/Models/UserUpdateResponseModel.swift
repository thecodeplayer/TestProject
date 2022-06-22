//
//  UpdateUserResponseModel.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/22/22.
//

import Foundation

struct UserUpdateResponseModel: Codable {
    
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case updatedAt = "updatedAt"
    }
    
}
