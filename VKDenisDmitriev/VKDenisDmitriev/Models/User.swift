//
//  User.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    var id: Int
    var name: String
    var photo: Image
}

func usersDictinary(users: [User]) -> [String:[User]] {
    var dictinary: [String:[User]] = [:]
    for user in users {
        let index = String(user.name.prefix(1))
        dictinary[index]?.append(user)
    }
    return dictinary
}
