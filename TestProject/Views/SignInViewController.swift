//
//  ViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/10/22.
//

import UIKit

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
            let email = try emailTextField.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            
            let signIn = UserModel(email: email, password: password)
            API.shared.signInUser(user: signIn, completionHandler: {
                (isSuccess, message) in
                if isSuccess {
                    CustomSnackBar.shared.showAlert(for: message)
                } else {
                    CustomSnackBar.shared.showAlert(for: message)
                }
            })
//            UserDefaultsManager.shared.saveEmail(email: email)
//            CustomSnackBar.shared.showAlert(for: "Success \(UserDefaultsManager.shared.getEmail())")
//            KeychainManager.shared.saveToken(token: "adjfhdnfn25362389hajfj")
//            CustomSnackBar.shared.showAlert(for: "Success \(KeychainManager.shared.getToken())")
        } catch(let error) {
            CustomSnackBar.shared.showAlert(for: (error as! ValidationError).message)
        }
    }
    
}

