//
//  Users.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/17/22.
//

import Foundation

struct UsersResponseModel: Codable {
    
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [UserModel]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case per_page = "per_page"
        case total = "total"
        case total_pages = "total_pages"
        case data = "data"
    }
    
}
