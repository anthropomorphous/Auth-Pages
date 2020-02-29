//
//  StartViewController.swift
//  Greetings
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {
    
    var loginText: String?
    let userCollection = Users()
    var user: User?
    @IBOutlet weak var loginField: UITextField!
    
    @IBAction func loginTapped(_ sender: UIButton) {
        createUser(loginText!)
        let helloViewController = HelloViewController()
        helloViewController.delegate = self
        helloViewController.user = userCollection.users.first
        helloViewController.tabBarItem = UITabBarItem(title: "Hello", image: UIImage(named: "bolt-2x"), tag: 0)
        let editViewController = EditViewController()
        editViewController.tabBarItem = UITabBarItem(title: "Edit", image: UIImage(named: "bolt-2x"), tag: 0)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [helloViewController, editViewController]
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        loginText = loginField.text
        return false
    }
    
    func createUser(_ name: String) {
        userCollection.users = [
            User(name: name)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
    }
}

extension StartViewController: UsersDelegate {
    func passUser(_ user: User) {
        self.user = user
    }
}
