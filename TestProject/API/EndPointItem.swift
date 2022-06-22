//
//  EndPointItem.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import Alamofire

enum EndPointItem {
    
    case login
    case register
    case users
    case get_user
    case update_user
    case delete_user
    
}

extension EndPointItem: EndPointType {
    
    var baseURL: String {
        switch self {
        default: return "https://reqres.in/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .users:
            return .get
        case .get_user:
            return .get
        case .update_user:
            return .put
        case .delete_user:
            return .delete
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login, .register, .users, .get_user, .update_user, .delete_user:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest",
                    "x-access-token": "someToken"]
        }
    }
    
    var url: String {
        switch self {
        default:
            return self.baseURL
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
}
