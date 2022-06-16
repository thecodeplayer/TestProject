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
    var response: Response?
    var error: ErrorObject?
    
    private let signInPresenter = SignInPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        signInButton?.layer.cornerRadius = CGFloat(radius)
        signInPresenter.delegate = self
        
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
            
            signInPresenter.signInUser(params: signIn)
            
            if (response != nil){
                UserDefaultsManager.shared.saveEmail(email: email)
                KeychainManager.shared.saveToken(token: response!.token)
                CustomSnackBar.shared.showAlert(for: "Welcome")
            } else if (error != nil){
                CustomSnackBar.shared.showAlert(for: "\(error!.error)")
            }
        } catch(let error) {
            CustomSnackBar.shared.showAlert(for: (error as! ValidationError).message)
        }
    }
    
}

extension SignInViewController : SignInPresenterDelegate {
    func signInResponse(response: Response) {
        self.response = response
    }
    
    func signInError(error: ErrorObject) {
        self.error = error
    }
    
}

