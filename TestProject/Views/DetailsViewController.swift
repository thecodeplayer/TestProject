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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    
    var userId: Int?
    var user: UserModel?
    var error: ErrorObject?
    var updatedAt: UserUpdateResponseModel?
    
    private let detailsPresenter = DetailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailsPresenter.delegate = self
        detailsPresenter.getUserDetails(user: userId!)
    }
    
    @IBAction func updateUser(_ sender: Any) {
        validate()
    }
    
    func validate() {
        do {
            let job = try jobTextField.validatedText(validationType: ValidatorType.job)
            detailsPresenter.updateUserDetails(userId: userId, name: user!.first_name, job: job)
        } catch(let error) {
            CustomSnackBar.shared.showAlert(for: (error as! ValidationError).message)
        }
    }
    
}

extension DetailsViewController: DetailsPresenterDelegate {
    func userDetails(user: UserModel?) {
        self.user = user
        nameTextField.text = "\(self.user!.first_name) \(self.user!.last_name)"
        emailTextField.text = self.user?.email
        let url = URL(string: self.user!.avatar)
        userAvatar.af.setImage(withURL: url!)
    }
    
    func errorFetching(error: ErrorObject) {
        self.error = error
    }
    
    func userUpdate(updatedAt: UserUpdateResponseModel?) {
        self.updatedAt = updatedAt
        CustomSnackBar.shared.showAlert(for: "Updated at: \(updatedAt!.updatedAt)")
    }
    
}
