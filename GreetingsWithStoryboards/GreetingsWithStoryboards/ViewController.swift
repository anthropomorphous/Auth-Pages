//
//  ViewController.swift
//  GreetingsWithStoryboards
//
//  Created by ios_school on 2/27/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var text: String?
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBAction func showHelloVC(_ sender: UIButton) {
        performSegue(withIdentifier: "showStartView", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        text = loginField.text
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? UITabBarController, segue.identifier == "showStartView" {
            if let helloVC = controller.viewControllers![0] as? HelloViewController {
                helloVC.text = text
                helloVC.tabBarItem = UITabBarItem(title: "Hello", image: UIImage(named: "bolt-2x"), tag: 0)
            }
            if let editVC = controller.viewControllers![1] as? EditViewController {
                editVC.tabBarItem = UITabBarItem(title: "Edit", image: UIImage(named: "bolt-2x"), tag: 0)
            }
        }
        
        
    
    }
}

