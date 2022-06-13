//
//  RegisterViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/13/22.
//

import UIKit
import TTGSnackbar

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fullNameTextField.layer.cornerRadius = CGFloat(radius)
        emailTextField.layer.cornerRadius = CGFloat(radius)
        phoneNumberTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        
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
            try fullNameTextField.validatedText(validationType: ValidatorType.fullname)
            try emailTextField.validatedText(validationType: ValidatorType.email)
            try phoneNumberTextField.validatedText(validationType: ValidatorType.phoneNumber)
            try passwordTextField.validatedText(validationType: ValidatorType.password)
            showAlert(for: "Success")
        } catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    //For showing snackbar
    func showAlert(for alert: String) {
        let snackbar = TTGSnackbar(message: alert, duration: .long)

        snackbar.icon = UIImage(named: "emoji_cool_small")

        snackbar.show()
    }

}
