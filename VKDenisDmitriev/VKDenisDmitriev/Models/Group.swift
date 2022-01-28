//
//  Group.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 15.01.2022.
//

import Foundation
import SwiftUI
import RealmSwift

class Group: Object, Identifiable, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var about: String = ""
    @objc dynamic var photo: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case about = "description"
        case photo = "photo_200"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.about = try container.decode(String.self, forKey: .about)
        self.photo = try container.decode(String.self, forKey: .photo)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
