//
//  Post.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 30.01.2022.
//

import Foundation

final class Post: Decodable {
    var id: Int = 0
    var date: TimeInterval = 0
    
    var type: PostType = .post
    
    var text: String?
    
    var photos: [Photo]?
    var videos: [Video]?

    var likes: Social?
    var comments: Social?
    var views: Social?
    var reposts: Social?
    
    var author: Author?
//    var user: User?
//    var group: Group?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "source_id"
        case date
        case text
        case type
        case photos
        case photo
        case items
        case attachments
        case likes
        case comments
        case views
        case reposts
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.date = try container.decode(TimeInterval.self, forKey: .date)
        self.text = try? container.decode(String.self, forKey: .text)
        self.type = try container.decode(PostType.self, forKey: .type)
        
        switch self.type {
        case .photo:
            let photosContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .photos)
            self.photos = try? photosContainer?.decode([Photo].self, forKey: .items)
        case .post:
            let attachments = try? container.decode([Attachments].self, forKey: .attachments)
            //photos = []
            //videos = []
            attachments?.forEach({ (attachment) in
                switch attachment.type {
                case .photo:
                    if let photo = attachment.photo {
                        if photos == nil { photos = [] }
                        photos?.append(photo)
                    }
                case .video:
                    if let video = attachment.video {
                        if videos == nil { videos = [] }
                        videos?.append(video)
                    }
                }
                
            })
        }
        
        self.likes = try? container.decode(Social.self, forKey: .likes)
        self.comments = try? container.decode(Social.self, forKey: .comments)
        self.views = try? container.decode(Social.self, forKey: .views)
        self.reposts = try? container.decode(Social.self, forKey: .reposts)
    }
    
    enum TextMode {
        case full
        case short
    }
    
    enum AlbomMode {
        case empty
        case single
        case double
        case triple
    }
}

enum PostType: String, Decodable {
    case post
    case photo
}

struct Social: Decodable {
    let count: Int
}

final class Attachments: Decodable {
    var type: AttachmentsType = .photo
    var photo: Photo?
    var video: Video?
    
    enum CodingsKeys: String, CodingKey {
        case type
        case photo
        case video
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingsKeys.self)
        self.type = try container.decode(AttachmentsType.self, forKey: .type)
        self.photo = try? container.decode(Photo.self, forKey: .photo)
        self.video = try? container.decode(Video.self, forKey: .video)
    }
}

enum AttachmentsType: String, Decodable {
    case photo
    case video
}
