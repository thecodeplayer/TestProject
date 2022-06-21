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
    
    init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    func call<T>(type: EndPointType, params: Parameters? = nil,  path: String, completionHandler: @escaping (Swift.Result<T?, ErrorObject>) -> ()) where T: Codable{
        self.sessionManager.request(URL(string: "\(type.url)\(path)")!,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().response { response in
            switch response.result {
            case .success(_):
                switch response.response?.statusCode {
                case 200:
                    do {
                        guard let data = response.data else { return }
                        let json = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(json))
                    } catch {
                        debugPrint("Error: \(error)")
                    }
                    break
                default:
                    debugPrint(response)
                }
            case .failure(_):
                completionHandler(.failure(self.parseApiError(data: response.data)))
                break
            }
        }
    }
    private func parseApiError(data: Data?) -> ErrorObject {
            let decoder = JSONDecoder()
            if let jsonData = data, let error = try? decoder.decode(ErrorObject.self, from: jsonData) {
                return ErrorObject(error: error.error)
            }
            return ErrorObject(error: "Unknown Error")
        }
    }
