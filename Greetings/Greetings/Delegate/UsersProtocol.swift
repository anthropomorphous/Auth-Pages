//
//  UsersProtocol.swift
//  Greetings
//
//  Created by ios_school on 2/25/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import Foundation

protocol UsersDelegate: AnyObject {
    func passUser(_ user: User)
}


