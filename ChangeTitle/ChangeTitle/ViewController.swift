//
//  ViewController.swift
//  ChangeTitle
//
//  Created by ios_school on 2/23/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleText: String?
    @IBOutlet weak var label: UILabel!
    
    @IBAction func changeTitle(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ChangingTitle", bundle: nil)
        guard let changingTitleViewController = storyboard.instantiateInitialViewController() as? ChangingTitleViewController else { return }
        changingTitleViewController.modalPresentationStyle = .overCurrentContext
        changingTitleViewController.delegate = self
        changingTitleViewController.titleText = label.text
        present(changingTitleViewController, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Привет!"
    }
}

extension ViewController: ChangeTitleProtocol {
    func passNewTitle(of text: String) {
        label.text = text
    }
    func passOldTitle(_ text: String) {
        titleText = label.text
    }
}
