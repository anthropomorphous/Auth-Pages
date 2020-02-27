//
//  ChangingTitleViewController.swift
//  ChangeTitleWIthNavController
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class ChangingTitleViewController: UIViewController {

    weak var delegate: ChangingTitleProtocol!
    var titleText: String?
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func saveTapped(_ sender: UIButton) {
        updateTitle()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateTitle() {
        guard let newTitleText = titleField.text else { return }
        delegate?.passNewTitle(of: newTitleText)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Change Title"
        delegate?.passOldTitle(of: titleText!)
        titleField.text = titleText
    }

}
