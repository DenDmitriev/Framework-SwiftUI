//
//  NewsViewModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 30.01.2022.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    let vkService: VKService
    @Published var posts: [Post] = []
    private var nextFrom = ""
    
    init() {
        self.vkService = VKService()
    }
    
    func fetchNews() {
        vkService.wall { [weak self] (posts, nextFrom) in
            guard let self = self else { return }
            self.nextFrom = nextFrom
            print("add new \(posts.count) posts")
            self.posts = self.posts + posts
        }
    }
    
}
