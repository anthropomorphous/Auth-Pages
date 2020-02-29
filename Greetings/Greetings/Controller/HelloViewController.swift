//
//  HelloViewController.swift
//  Greetings
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    var user: User?
    var receivedUser: User?
    
    weak var delegate: UsersDelegate?
    var nameChanged: Bool = false
    
    @IBOutlet weak var label: UILabel!
    
    func updateLabel(_ text: String) {
        label.text = "Hello, " + text + "!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let editViewController = self.tabBarController?.viewControllers?[1] as? EditViewController else { return }
        editViewController.delegate = self
        editViewController.user = user
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if nameChanged {
            updateLabel(receivedUser!.name)
        } else {
            delegate?.passUser(user!)
            
            updateLabel(user!.name)
        }
    }
}

extension HelloViewController: UserEditDelegate {
    func passUser(_ user: User) {
        self.user = user
    }
    
    func passUserWithNewName(_ user: User) {
        self.receivedUser = user
        nameChanged = true
    }
}
