//
//  Album.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 04.02.2022.
//

import Foundation

struct Album: Decodable {
    
    var id: Int = 0
    var thumbId: Int = 0
    var thumbSrc: String = ""
    var ownerId: Int = 0
    var title: String = ""
    var size: Int = 0
    
    enum Default: String {
        ///фотографии со стены
        case wall
        ///фотографии профиля
        case profile
        ///сохраненные фотографии. Возвращается только с ключом доступа пользователя
        case saved
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case thumbId = "thumb_id"
        case thumbSrc = "thumb_src"
        case ownerId = "owner_id"
        case title
        case size
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.thumbId = try container.decode(Int.self, forKey: .thumbId)
        self.thumbSrc = try container.decode(String.self, forKey: .thumbSrc)
        self.ownerId = try container.decode(Int.self, forKey: .ownerId)
        self.title = try container.decode(String.self, forKey: .title)
        self.size = try container.decode(Int.self, forKey: .size)
    }
}
