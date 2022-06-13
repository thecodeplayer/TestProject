//
//  APIRouter.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/10/22.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case information
    
    private var method: HTTPMethod {
        switch self {
        case .information:
            return .get
            
        }
    }

    private var path: String {
        switch self {
        case .information:
            return "/information"
        }
    }

    private var parameters: Parameters? {
        switch self {
        case .information:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let base = URL(string: Constants.Server.baseURL)!
        let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
        let url = URL(string: baseAppend!)
        
        var urlRequest =  URLRequest(url: url!)
        
        urlRequest.httpMethod = method.rawValue
        
        // Parameters if added
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

