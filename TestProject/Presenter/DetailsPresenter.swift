//
//  DetailsPresenter.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/20/22.
//

import Foundation
import Alamofire

protocol DetailsPresenterDelegate: AnyObject {
    func userDetails(user: UserModel?)
    func errorFetching(error: ErrorObject)
    func userUpdate(updatedAt: UserUpdateResponseModel?)
}

class DetailsPresenter {
    
    let apiManager = APIManager(sessionManager: Session())
    weak var delegate: DetailsPresenterDelegate?
    
    func getUserDetails(user: Int) {
        apiManager.call(type: EndPointItem.get_user, path: "api/users/\(user)", completionHandler: {
            (res: Swift.Result<UserDetailsResponseModel?, ErrorObject>) in
            switch res {
            case .success(let data):
                self.delegate?.userDetails(user: data?.data)
                break
            case .failure(let error):
                self.delegate?.errorFetching(error: error)
                break
            }
        })
    }
    
    func updateUserDetails(userId: Int?, name: String, job: String) {
        apiManager.call(type: EndPointItem.update_user, params: ["name": name, "job": job], path: "api/users/\(userId)", completionHandler: {
            (res: Swift.Result<UserUpdateResponseModel?, ErrorObject>) in
            switch res {
            case .success(let response):
                self.delegate?.userUpdate(updatedAt: response)
                break
            case .failure(let error):
                self.delegate?.errorFetching(error: error)
                break
            }
        })
    }
}
