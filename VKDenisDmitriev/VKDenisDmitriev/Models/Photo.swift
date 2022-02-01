//
//  Photo.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 17.01.2022.
//

import Foundation
import SwiftUI

final class Photo: Decodable {
    var id: Int = 0
    var ownerId: Int = 0
    var albumId: Int?
    
    private var photos: [PhotoOfSize] = []
    private var photosOfSize: [PhotoOfSize.Size : PhotoOfSize] {
        var dict: [PhotoOfSize.Size : PhotoOfSize] = [:]
        photos.forEach { photo in
            dict[photo.type] = photo
        }
        return dict
    }
    
    func photo(_ size: PhotoOfSize.Size) -> PhotoOfSize {
        switch size {
        case .w: //height 1037
            if let photo = photosOfSize[.w] {
                return photo
            } else {
                fallthrough
            }
        case .z: //height 848
            if let photo = photosOfSize[.z] {
                return photo
            } else {
                fallthrough
            }
        case .y: //height 535
            if let photo = photosOfSize[.y] {
                return photo
            } else {
                fallthrough
            }
        case .x: //height 400
            if let photo = photosOfSize[.x] {
                return photo
            } else {
                fallthrough
            }
        case .r: //height 340
            if let photo = photosOfSize[.r] {
                return photo
            } else {
                fallthrough
            }
        case .q: //height 213
            if let photo = photosOfSize[.q] {
                return photo
            } else {
                fallthrough
            }
        case .p: //height 133
            if let photo = photosOfSize[.p] {
                return photo
            } else {
                fallthrough
            }
        case .o: //height 87
            if let photo = photosOfSize[.o] {
                return photo
            } else {
                fallthrough
            }
        case .m: //height 86
            if let photo = photosOfSize[.m] {
                return photo
            } else {
                fallthrough
            }
        case .s: //height 50
            if let photo = photosOfSize[.s] {
                return photo
            } else {
                return PhotoOfSize(for: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/VK_Full_Logo_%282021-present%29.svg/276px-VK_Full_Logo_%282021-present%29.svg.png")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case albomId = "album_id"
        case photos = "sizes"
        case width
        case height
        case url
        case type
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.ownerId = try container.decode(Int.self, forKey: .ownerId)
        self.albumId = try? container.decode(Int.self, forKey: .albomId)
        self.photos = try container.decode([PhotoOfSize].self, forKey: .photos)
    }
}

final class PhotoOfSize: Decodable {
    var width: Int = 0
    var height: Int = 0
    var url: String = ""
    var type: Size = .m
    
    enum Size: String {
        ///max side 130px
        case m
        ///for aspect less 3:2 max height 130px.
        ///for aspect more 3:2 max width 130px
        case o
        ///for aspect less 3:2 max height 200px.
        ///for aspect more 3:2 max width 200px
        case p
        ///for aspect less 3:2 max height 320px.
        ///for aspect more 3:2 max width 320px
        case q
        ///for aspect less 3:2 max height 510px.
        ///for aspect more 3:2 max width 510px
        case r
        ///height max 75
        case s
        ///max size 2560x2048px
        case w
        ///height max 604px
        case x
        ///max side 807px
        case y
        ///max size 1080x1024px
        case z
    }
    
    enum CodingKeys: String, CodingKey {
        case width
        case height
        case url
        case type
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
        self.url = try container.decode(String.self, forKey: .url)
        let type = try container.decode(String.self, forKey: .type)
        self.type = size(string: type)
    }
    
    convenience init(for url: String) {
        self.init()
        self.url = url
    }
    
    func size(string: String) -> Size {
        switch string {
        case Size.m.rawValue:
            return Size.m
        case Size.o.rawValue:
            return Size.o
        case Size.p.rawValue:
            return Size.p
        case Size.q.rawValue:
            return Size.q
        case Size.r.rawValue:
            return Size.r
        case Size.s.rawValue:
            return Size.s
        case Size.w.rawValue:
            return Size.w
        case Size.x.rawValue:
            return Size.x
        case Size.y.rawValue:
            return Size.y
        case Size.z.rawValue:
            return Size.z
        default:
            return .m
        }
    }
}
