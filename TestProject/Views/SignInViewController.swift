//
//  ViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/10/22.
//

import UIKit
import TTGSnackbar

class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    let radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        signInButton?.layer.cornerRadius = CGFloat(radius)
        
    }

    //To sign up screen
    @IBAction func goToSignUp(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: "SignUp") as! SignUpViewController
        self.present(signUpViewController, animated: true, completion: nil)
    }
    
    //Onclick
    @IBAction func signInValidation(_ sender: Any) {
        validate()
    }
    
    //UITExtField Validations
    func validate() {
        do {
            try emailTextField.validatedText(validationType: ValidatorType.email)
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

