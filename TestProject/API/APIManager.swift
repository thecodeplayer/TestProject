//
//  APIManager.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import Alamofire

class APIManager {
    
    private let sessionManager: Session
    static let networkEnviroment: NetworkEnvironment = .feature
    
    init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    func call(type: EndPointType, params: Parameters? = nil, handler: @escaping (()?, _ error: AlertMessage?)->()) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { data in
            switch data.result {
            case .success(_):
                handler((), nil)
                break
            case .failure(_):
                handler(nil, self.parseApiError(data: data.data))
                break
            }
        }
    }
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: Constants.errorAlertTitle, body: error.key ?? error.message)
        }
        return AlertMessage(title: Constants.errorAlertTitle, body: Constants.genericErrorMessage)
    }
}
