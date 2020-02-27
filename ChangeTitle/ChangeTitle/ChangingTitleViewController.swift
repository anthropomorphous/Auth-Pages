//
//  ChangingTitleViewController.swift
//  ChangeTitle
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import UIKit

class ChangingTitleViewController: UIViewController {

    weak var delegate: ChangeTitleProtocol?
    var titleText: String?
    
    @IBOutlet weak var titleField: UITextField!
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        updateTitle()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateTitle() {
        guard let newTitleText = titleField.text else { return }
        print(newTitleText)
        delegate?.passNewTitle(of: newTitleText)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate?.passOldTitle(titleText!)
        titleField.text = titleText
    }

}
