//
//  HomePageViewController.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/16/22.
//

import UIKit

class HomePageViewController: UIViewController {
    
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

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        homePagePresenter.setViewDelegate(delegate: self)
        homePagePresenter.getUsers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}

extension HomePageViewController: HomePagePresenterDelegate {
    func userDelete(deleted: UserDeleteResponseModel?) {
        debugPrint("Deleted")
    }
    
    func presentUsers(users: [UserModel]) {
        shouldHideLoader(isHidden: false, vc: self.view)
        self.users = users
        self.tableView.reloadData()
        shouldHideLoader(isHidden: true, vc: self.view)
    }
    
    func errorFetching(error: ErrorObject) {
        self.error = error
    }
    
}

extension HomePageViewController : UITableViewDelegate, UITableViewDataSource {
    
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
        homePagePresenter.userTap(userId: selectedUser!.id, controller: self)
    }
    
}
