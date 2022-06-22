//
//  HomePagePresenter.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/17/22.
//

import Foundation
import Alamofire
import UIKit

protocol HomePagePresenterDelegate: AnyObject {
    func presentUsers(users: [UserModel])
    func errorFetching(error: ErrorObject)
    func userDelete(deleted: UserDeleteResponseModel?)
}

typealias PresenterDelegate = HomePagePresenterDelegate & UIViewController
class HomePagePresenter {
    
    let apiManager = APIManager(sessionManager: Session())
    weak var delegate: PresenterDelegate?
    
    func getUsers() {
        apiManager.call(type: EndPointItem.users, params: nil, path: "api/users", completionHandler: {
            (res: Swift.Result<UsersResponseModel?, ErrorObject>) in
            switch res {
            case .success(let data):
                self.delegate?.presentUsers(users: data!.data)
                break
            case .failure(let error):
                self.delegate?.errorFetching(error: error)
                break
            }
        })
    }
    
    func deleteUser(userId: Int) {
        apiManager.call(type: EndPointItem.delete_user, path: "api/users/\(userId)", completionHandler: {
            (res:Swift.Result<UserDeleteResponseModel?, ErrorObject>) in
            switch res {
            case .success(let user):
                self.delegate?.userDelete(deleted: user)
                break
            case .failure(let error):
                self.delegate?.errorFetching(error: error)
                break
            }
        })
    }
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func userTap(userId: Int, controller: HomePageViewController){
        let alert = UIAlertController(title: "Choose one", message: "What do you want to do in this user?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "View/Edit", style: .default, handler: { action in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsView") as! DetailsViewController
            detailsViewController.userId = userId
            controller.present(detailsViewController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { action in
            self.deleteUser(userId: userId)
            CustomSnackBar.shared.showAlert(for: "Deleted Successfully!")
        } ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        delegate?.present(alert, animated: true)
    }
}

