//
//  EditViewController.swift
//  Greetings
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginField: UITextField!
    var loginText: String?
    let userCollection = Users()
    var user: User?
    var someUser: User?
    var usersCollection: Users?
    
    weak var delegate: UserEditDelegate?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        loginText = loginField.text
        updateUser(loginText!)
        return false
    }
    
    func updateUser(_ name: String) {
        user!.name = name
        guard let receivedUser = user else { return }
        delegate?.passUserWithNewName(receivedUser)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
    
        delegate?.passUser(user!)
        loginField.text = user!.name
    }
    
}
