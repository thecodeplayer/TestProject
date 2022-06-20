//
//  DetailViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/17/22.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    var userId: Int?
    var user: UserModel?
    var error: ErrorObject?
    
    private let detailsPresenter = DetailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailsPresenter.delegate = self
        detailsPresenter.getUserDetails(user: userId!)
    }
}

extension DetailsViewController: DetailsPresenterDelegate {
    func userDetails(user: UserModel?) {
        self.user = user
        userName.text = "\(self.user!.first_name) \(self.user!.last_name)"
        userEmail.text = self.user?.email
        let url = URL(string: self.user!.avatar)
        userAvatar.af.setImage(withURL: url!)
    }
    
    func errorFetching(error: ErrorObject) {
        self.error = error
    }
}
