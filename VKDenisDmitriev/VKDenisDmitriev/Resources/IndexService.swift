//
//  IndexService.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 17.01.2022.
//

import Foundation

struct IndexService {
    
    var users: [User]
    var indexs: [String] {
        Array(dictionary.keys.sorted())
    }
    
    var dictionary: [String:[User]] {
        var dictinary: [String:[User]] = [:]
        for user in users {
            let index = String(user.name.prefix(1))
            if dictinary[index]?.isEmpty ?? true  {
                dictinary[index] = [user]
            } else {
                dictinary[index]?.append(user)
            }
        }
        return dictinary
    }
}
