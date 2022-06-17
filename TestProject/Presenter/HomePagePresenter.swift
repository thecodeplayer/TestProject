//
//  HomePagePresenter.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/17/22.
//

import Foundation
import Alamofire

protocol HomePagePresenterDelegate: AnyObject {
    func presentUsers(users: [UserModel])
    func errorFetching(error: ErrorObject)
}

class HomePagePresenter {
    
    let apiManager = APIManager(sessionManager: Session())
    weak var delegate: HomePagePresenterDelegate?
    
    func getUsers() {
        apiManager.call(type: EndPointItem.users, params: nil, completionHandler: {
            (res: Swift.Result<UsersResponseModel?, ErrorObject>) in
            switch res {
            case .success(let data):
                self.delegate?.presentUsers(users: data!.data)
//                debugPrint(data!.data)
                break
            case .failure(let error):
                self.delegate?.errorFetching(error: error)
                break
            }
        })
    }
}

