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
        navigationController?.pushViewController(helloViewController, animated: true)
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
        tabBarController?.tabBar.isHidden = true
        loginField.delegate = self
    }
}

extension StartViewController: UsersDelegate {
    func passUser(_ user: User) {
        self.user = user
    }
}
