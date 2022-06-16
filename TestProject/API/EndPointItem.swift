//
//  EndPointItem.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import Alamofire

enum EndPointItem {
    
    case register
    
}

extension EndPointItem: EndPointType {
    
    var baseURL: String {
        switch self {
            default: return "https://reqres.in/"
        }
    }
    
    var path: String {
        switch self {
        case .register:
            return "api/register"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .register:
            return .post
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
    case .register:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest",
                    "x-access-token": "someToken"]
        default:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
}
