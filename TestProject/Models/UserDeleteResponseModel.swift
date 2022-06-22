//
//  UserDeleteResponseModel.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/22/22.
//

import Foundation

struct UserDeleteResponseModel: Codable {
    
    let deleted: String
    
    enum CodingKeys: String, CodingKey {
        case deleted = "deleted"
    }
    
}
