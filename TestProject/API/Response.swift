//
//  Response.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/16/22.
//

import Foundation


struct Response: Decodable {
    
    var id: Int
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case token = "token"
    }
    
}
