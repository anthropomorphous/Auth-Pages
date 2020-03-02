//
//  EditViewController.swift
//  GreetingsWithStoryboards
//
//  Created by ios_school on 2/27/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    var text: String?
    
    @IBOutlet weak var loginField: UITextField!
    
    weak var delegate: LoginEditDelegate?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        delegate?.passNewName(loginField.text!)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
        loginField.text = text
    }

}
