//
//  ViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userNameTextField.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
        signInButton?.layer.cornerRadius = 22
        
    }

    @IBAction func goToSignUp(_ sender: Any) {
        
        present(RegisterViewController(), animated: true)
    }
    
}

