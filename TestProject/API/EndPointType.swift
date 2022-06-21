//
//  EndPointType.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import Alamofire

protocol EndPointType {
    
    var baseURL: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: String { get }
    var encoding: ParameterEncoding { get }
    
}
