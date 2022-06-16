//
//  SignUpPresenter.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import Alamofire

protocol SignUpPresenterDelegate: AnyObject {
    func signUpResponse(response: Response)
    func signUpError(error: ErrorObject)
}

class SignUpPresenter {
    
    let apiManager = APIManager(sessionManager: Session())
    weak var delegate: SignUpPresenterDelegate?
    
    func signUpUser(params: UserModel) {
        apiManager.call(type: EndPointItem.register, params: params as? Parameters, completionHandler: {
            (res: Swift.Result<Response, ErrorObject>) in
            switch res {
            case .success(let data):
                self.delegate?.signUpResponse(response: data)
                break
            case .failure(let error):
                self.delegate?.signUpError(error: error)
                break
            }
        })
    }
}
