//
//  Group.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 15.01.2022.
//

import Foundation
import SwiftUI
import RealmSwift

class Group: Object, Identifiable, Decodable, Author {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var about: String?
    //@objc dynamic var photo: String = ""
    @objc dynamic private var photo50: String?
    @objc dynamic private var photo100: String?
    @objc dynamic private var photo200: String?
    @objc dynamic private var photo400: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case about = "description"
        //case photo = "photo_200"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case photo400 = "photo_400"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.about = try container.decodeIfPresent(String.self, forKey: .about)
        //self.photo = try container.decode(String.self, forKey: .photo)
        self.photo50 = try container.decodeIfPresent(String.self, forKey: .photo50)
        self.photo100 = try container.decodeIfPresent(String.self, forKey: .photo100)
        self.photo200 = try container.decodeIfPresent(String.self, forKey: .photo200)
        self.photo400 = try container.decodeIfPresent(String.self, forKey: .photo400)
    }
    
//    enum Size {
//        case px50, px100, px200
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
