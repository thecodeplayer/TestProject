//
//  SignInPresenter.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/16/22.
//

import Foundation
import Alamofire

protocol SignInPresenterDelegate: AnyObject {
    func signInResponse(response: ResponseModel?)
    func signInError(error: ErrorObject)
}

class SignInPresenter {
    
    let apiManager = APIManager(sessionManager: Session())
    weak var delegate: SignInPresenterDelegate?
    
    func signInUser(params: LoginModel) {
        apiManager.call(type: EndPointItem.login, params: params as? Parameters, path: "api/login", completionHandler: {
            (res: Swift.Result<ResponseModel?, ErrorObject>) in
            switch res {
            case .success(let data):
                self.delegate?.signInResponse(response: data )
                break
            case .failure(let error):
                self.delegate?.signInError(error: error)
                break
            }
        })
    }
}
