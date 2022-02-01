//
//  Response.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    var count: Int
    var items: [T]
    
    enum CodingKeys: String, CodingKey {
        case response
        case items
        case count
    }
    
    init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        self.items = try response.decode([T].self, forKey: .items)
        self.count = try response.decode(Int.self, forKey: .count)
    }
}

struct ResponseSingle<T: Decodable>: Decodable {
    var response: [T]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try container.decode([T].self, forKey: .response)
    }
}

class ResponsePost: Decodable {
    var items: [Post]
    var users: [User]?
    var groups: [Group]?
    
    var nextFrom: String
    
    enum CodingKeys: String, CodingKey {
        case response
        case items
        case profiles
        case groups
        case nextFrom = "next_from"
    }
    
    required init(from decoder: Decoder) throws {
        let topContainer = try decoder.container(keyedBy: CodingKeys.self)
        let container = try topContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        self.items = try container.decode([Post].self, forKey: .items)
        self.users = try? container.decode([User].self, forKey: .profiles)
        self.groups = try? container.decode([Group].self, forKey: .groups)
        self.nextFrom = try container.decode(String.self, forKey: .nextFrom)
    }
    
    func findAuthorUserOfPost() {
        guard let users = self.users else { return }
        for user in users {
            items.forEach { (post) in
                if post.id == user.id {
                    //post.user = user
                    post.author = user
                }
            }
        }
    }
    func findAuthorGroupOfPost() {
        guard let groups = self.groups else { return }
        for group in groups {
            items.forEach { (post) in
                if post.id == (group.id * (-1)) {
                    //post.group = group
                    post.author = group
                }
            }
        }
    }
}
