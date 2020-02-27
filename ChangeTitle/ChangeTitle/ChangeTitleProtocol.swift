//
//  ChangeTitleProtocol.swift
//  ChangeTitle
//
//  Created by ios_school on 2/24/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import Foundation

protocol ChangeTitleProtocol: AnyObject {
    func passNewTitle(of text: String)
    func passOldTitle(_ text: String)
}
