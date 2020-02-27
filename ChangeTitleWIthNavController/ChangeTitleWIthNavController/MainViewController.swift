//
//  MainViewController.swift
//  ChangeTitleWIthNavController
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var titleText: String?
    
    @IBAction func changeTitle(_ sender: UIButton) {
        let changingTitleViewController = ChangingTitleViewController()
        navigationController?.pushViewController(changingTitleViewController, animated: true)
        
        changingTitleViewController.modalPresentationStyle = .overCurrentContext
        changingTitleViewController.delegate = self
        changingTitleViewController.titleText = label.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        label.text = "Привет!"
    }

}

extension MainViewController: ChangingTitleProtocol {
    func passNewTitle(of text: String) {
        label.text = text
    }
    func passOldTitle(of text: String) {
        titleText = label.text
    }
}
