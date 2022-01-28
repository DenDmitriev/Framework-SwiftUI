//
//  Session.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import Foundation

class Session: ObservableObject {
    
    static let shared = Session()
    
    var token: String = ""
    var id: String = ""
    
    var description: String {
        "User ID: \(id)\nToken: \(token)"
    }
    
    func create(_ token: String, _ id: String) {
        let session = Session.shared
        session.token = token
        session.id = id
        print(description)
    }
}
