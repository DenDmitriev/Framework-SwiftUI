//
//  User.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import Foundation
import SwiftUI
import RealmSwift

class User: Object, Identifiable, Decodable, Author {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic private var photo50: String?
    @objc dynamic private var photo100: String?
    @objc dynamic private var photo200: String?
    @objc dynamic private var photo400: String?
    @objc dynamic var online: Bool = false
    
    var status: String {
        online ? "online" : "offline"
    }
    var color: Color {
        online ? .green : .gray
    }
    var bdate: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case photo400 = "photo_400"
        case online = "online"
        case bdate
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let firstName = try container.decode(String.self, forKey: .firstName)
        let lastName = try container.decode(String.self, forKey: .lastName)
        self.name = firstName + " " + lastName
        self.photo50 = try container.decodeIfPresent(String.self, forKey: .photo50)
        self.photo100 = try container.decodeIfPresent(String.self, forKey: .photo100)
        self.photo200 = try container.decodeIfPresent(String.self, forKey: .photo200)
        self.photo400 = try container.decodeIfPresent(String.self, forKey: .photo400)
        self.online = try container.decode(Int.self, forKey: .online) == 1 ? true : false
        self.bdate = try container.decodeIfPresent(String.self, forKey: .bdate) ?? ""
    }
    
    required convenience init(for id: Int) {
        self.init()
        self.id = id
    }
    
//    enum Size {
//        case px50, px100, px200, px400
//    }
    
    func photo(_ size: Size) -> String {
        switch size {
        case .px400:
            if let photo = photo400 {
                return photo
            } else {
                fallthrough
            }
        case .px200:
            if let photo = photo200 {
                return photo
            } else {
                fallthrough
            }
        case .px100:
            if let photo = photo100 {
                return photo
            } else {
                fallthrough
            }
        case .px50:
            return photo50 ?? ""
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

//func usersDictinary(users: [User]) -> [String:[User]] {
//    var dictinary: [String:[User]] = [:]
//    for user in users {
//        let index = String(user.name.prefix(1))
//        dictinary[index]?.append(user)
//    }
//    return dictinary
//}
