//
//  HelloViewController.swift
//  GreetingsWithStoryboards
//
//  Created by ios_school on 2/27/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    var text: String?
    var receivedText: String?
    var nameChanged: Bool = false
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        updateText(text!)
        guard let editVC = tabBarController?.viewControllers![1] as? EditViewController else { return }
        
        editVC.delegate = self
        editVC.text = text
    }
    
    func updateText(_ text: String) {
        label.text = "Hello, " + text + "!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if nameChanged {
                updateText(receivedText!)
           }
       }
}

extension HelloViewController: LoginEditDelegate {    
    func passNewName(_ text: String) {
        self.receivedText = text
        nameChanged = true
    }
}
