//
//  PhotoGalleryViewModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 04.02.2022.
//

import Foundation

class PhotoGalleryViewModel: ObservableObject {

    @Published var photos: [Photo]
    var vkService: VKService
    var userID: Int
    
    init(userID: Int) {
        self.userID = userID
        self.vkService = VKService()
        self.photos = []
    }
    
    func fetchPhotos(for userID: Int, from albumID: String) {
        vkService.photos(for: userID, from: albumID) { [weak self] (results) in
            guard let self = self else { return }
            self.photos = results
        }
    }
}
