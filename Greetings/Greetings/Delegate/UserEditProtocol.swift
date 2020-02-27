//
//  UserEditProtocol.swift
//  Greetings
//
//  Created by ios_school on 2/26/20.
//  Copyright © 2020 ios_school. All rights reserved.
//

import Foundation

protocol UserEditDelegate: AnyObject {
    func passUser(_ user: User)
    func passUserWithNewName(_ user: User)
}
