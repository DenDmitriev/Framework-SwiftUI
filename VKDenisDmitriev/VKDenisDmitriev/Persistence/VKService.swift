//
//  VKService.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import Foundation

class VKService {
    
    let session = Session.shared
    
    enum Method {
        case user(id: String)
        case friends
        case groups(id: String)
        case wall
        case album(ownerID: String)
        case photos(ownerID: String, albumID: String)
        
        var path: String {
            switch self {
            case .user:
                return "/method/users.get"
            case .friends:
                return "/method/friends.get"
            case .groups:
                return "/method/groups.get"
            case .wall:
                return "/method/newsfeed.get"
            case .album:
                return "/method/photos.getAlbums"
            case .photos:
                return "/method/photos.get"
            }
        }
        
        var parameters: [String: String] {
            switch self {
            case .user(id: let id):
                return ["user_ids": id, "fields": "photo_200,online,bdate", "name_case":"nom"]
            case .friends:
                return ["order": "name", "fields": "photo_100,online", "name_case": "nom"]
            case .groups(id: let id):
                return ["user_id": id, "extended": "1", "fields": "description"]
            case .wall:
                return ["filters": "post,photo", "return_banned": "0", "count": "10"]
            case .album:
                return [:]
            case .photos(ownerID: let ownerID, albumID: let albumID):
                return ["owner_id" : ownerID, "album_id" : albumID, ]
            }
        }
    }
    
    func request(method: Method, add parameters: [String:String]? = nil, completion: @escaping ((Data?) -> Void)) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = method.path
        let queryItems = [
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        let methodQueryItems = method.parameters.map { URLQueryItem(name: $0, value: $1) }
        components.queryItems = queryItems + methodQueryItems
        guard let url = components.url else {
            completion(nil)
            return
        }
        
        let session = URLSession.shared
        print(url)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        task.resume()
    }
    
    func user(for id: Int, completion: @escaping ((User) -> Void)) {
        request(method: .user(id: String(id))) { (data) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(ResponseSingle<User>.self, from: data)
                guard let user = response.response.first else { return }
                DispatchQueue.main.async {
                    completion(user)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func friends(completion: @escaping (([User]) -> Void)) {
        request(method: .friends) { (data) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(Response<User>.self, from: data)
                let users = response.items.filter() { $0.name.lowercased() != "deleted " }
                DispatchQueue.main.async {
                    completion(users)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func groups(for id: Int, completion: @escaping (([Group]) -> Void)) {
        request(method: .groups(id: String(id))) { (data) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(Response<Group>.self, from: data)
                let groups = response.items
                DispatchQueue.main.async {
                    completion(groups)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func wall(from startTime: TimeInterval? = nil, before startFrom: String? = nil, completion: @escaping (([Post], String) -> Void)) {
        
        var parameters: [String : String] = [:]
        
        if let startTime = startTime {
            parameters["start_time"] = String(startTime + 1)
        }
        if let startFrom = startFrom {
            parameters["start_from"] = startFrom
        }
        
        request(method: .wall, add: parameters) { (data) in
            guard let data = data else {
                completion([], "")
                return
            }
            do {
                let response = try JSONDecoder().decode(ResponsePost.self, from: data)
                response.findAuthorUserOfPost()
                response.findAuthorGroupOfPost()
                DispatchQueue.main.async {
                    completion(response.items, response.nextFrom)
                }
            } catch {
                print(error.localizedDescription)
                completion([], "")
            }
        }
    }
    
    func photos(for userID: Int, from albumID: String, completion: @escaping (([Photo]) -> Void)) {
        request(method: .photos(ownerID: String(userID), albumID: albumID)) { data in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(Response<Photo>.self, from: data)
                let items = response.items
                DispatchQueue.main.async {
                    completion(items)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}


