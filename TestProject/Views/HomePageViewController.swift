//
//  HomePageViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/16/22.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users: [UserModel] = []
    var error: ErrorObject?
    var selectedUser: UserModel?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let homePagePresenter = HomePagePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homePagePresenter.delegate = self

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        homePagePresenter.getUsers()
        
//        debugPrint("Users: \(users)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = users[indexPath.row]
        cell.textLabel?.text = item.first_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      selectedUser = users[indexPath.row]
      return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Details", sender: self.tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let destinationVC = segue.destination as? DetailsViewController else {
        return
      }
      destinationVC.users = selectedUser
    }
    
}

extension HomePageViewController: HomePagePresenterDelegate {
    func presentUsers(users: [UserModel]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    func errorFetching(error: ErrorObject) {
        self.error = error
    }
    
}
