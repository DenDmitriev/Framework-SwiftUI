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
