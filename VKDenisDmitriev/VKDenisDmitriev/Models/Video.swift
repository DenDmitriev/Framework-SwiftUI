//
//  Video.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 01.02.2022.
//

import Foundation

final class Video: Decodable {
    var id: Int = 0
    var ownerId: Int = 0
    var title: String = ""
    var track: String = ""
    private var images: [ImageVideo] = []
    
    func image(_ size: Size) -> ImageVideo {
        var imageOfSize: ImageVideo?
        for image in images {
            switch size {
            case .s:
                if (120...359).contains(image.height) || (160...639).contains(image.width) {
                    imageOfSize = image
                    break
                } else { continue }
            case .m:
                if (360...719).contains(image.height) || (640...10279).contains(image.width) {
                    imageOfSize = image
                    break
                } else { continue }
            case .l:
                if (720...1080).contains(image.height) || (1280...1920).contains(image.width) {
                    imageOfSize = image
                    break
                } else { continue }
            }
        }
        if imageOfSize == nil { imageOfSize = image(.m) }
        return imageOfSize ?? ImageVideo()
    }
    
    enum Size {
        ///height from 120 to 359 px
        case s
        ///height from 360 to 719 px
        case m
        ///height  720 to 1080 px
        case l
    }

    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case title
        case track = "track_code"
        case images = "image"
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.ownerId = try container.decode(Int.self, forKey: .ownerId)
        self.title = try container.decode(String.self, forKey: .title)
        self.track = try container.decode(String.self, forKey: .track)
        self.images = try container.decode([ImageVideo].self, forKey: .images)
    }
}

final class ImageVideo: Decodable {
    var url: String = ""
    var width: Int = 0
    var height: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case url
        case width
        case height
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
    }
    
    convenience init(for url: String) {
        self.init()
    }
}
