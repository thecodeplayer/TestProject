//
//  RegisterViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/13/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userPhotoImageView: UIImageView!
    
    @IBOutlet weak var getPhotoButton: UIButton!
    
    
    let radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fullNameTextField.layer.cornerRadius = CGFloat(radius)
        emailTextField.layer.cornerRadius = CGFloat(radius)
        phoneNumberTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        userPhotoImageView.layer.cornerRadius = 64
        
    }
    
    //Onclick
    @IBAction func signUpValidation(_ sender: Any) {
        validate()
    }
    
    //To sign in screen
    @IBAction func goToSignIn(_ sender: Any) {
        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
        //        self.present(signInViewController, animated: true, completion: nil)
        // VC not popping
        navigationController?.popViewController(animated: true)
        
    }
    
    //UITExtField Validations
    func validate() {
        do {
            try userPhotoImageView.image = nil
            try fullNameTextField.validatedText(validationType: ValidatorType.fullname)
            let email = try emailTextField.validatedText(validationType: ValidatorType.email)
            try phoneNumberTextField.validatedText(validationType: ValidatorType.phoneNumber)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            
            let signUp = UserModel(email: email, password: password)
            API.shared.signUpUser(user: signUp, completionHandler: {
                (isSuccess, message) in
                if isSuccess {
                    CustomSnackBar.shared.showAlert(for: message)
                } else {
                    CustomSnackBar.shared.showAlert(for: message)
                }
            })
            
        } catch(let error) {
            CustomSnackBar.shared.showAlert(for: (error as! ValidationError).message)
        }
    }
    
    @IBAction func getPhotoButtonAction(_ sender: Any) {
        CameraGalleryPhotoManager.shared.showActionSheet(vc: self)
        CameraGalleryPhotoManager.shared.imagePickerBlock = { [weak self] image in
            guard let self = self else {
                return
            }
            self.userPhotoImageView.image = image
        }
    }
    
}
