//
//  API.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import Alamofire

class API {
    
    static let shared = API()
    
    func signUpUser(user: UserModel, completionHandler: @escaping (Bool, _ message: String) -> ()) {
        let httpHeaders: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(Constants.registerURL, method: .post, parameters: user as? Parameters, encoding: JSONEncoding.default, headers: httpHeaders).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true, "Sucess")
                    } else {
                        completionHandler(false, "Failed")
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(false, error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signInUser(user: UserModel, completionHandler: @escaping (Bool, _ message: String) -> ()) {
        let httpHeaders: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(Constants.registerURL, method: .post, parameters: user as? Parameters, encoding: JSONEncoding.default, headers: httpHeaders).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true, "Sucess")
                    } else {
                        completionHandler(false, "Failed")
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(false, error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, error.localizedDescription)
            }
        }
    }
}
