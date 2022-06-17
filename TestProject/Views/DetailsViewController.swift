//
//  DetailViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/17/22.
//

import UIKit

class DetailsViewController: UIViewController {
    

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    var users: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        commonInit()
    }
    

    private func commonInit() {
      guard let users = users else { return }
      
        userName.text = "\(users.first_name) \(users.last_name)"
        userEmail.text = users.email
    }

}
