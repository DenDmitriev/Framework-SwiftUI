//
//  PhotoItemView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 04.02.2022.
//

import SwiftUI
import Kingfisher

struct PhotoItemView: View {
    
    var photo: Photo
    
    var body: some View {
        NavigationLink(
            destination: PhotoView(photo: photo.photo(.z).url),
            label: {
                KFImage(URL(string: photo.photo(.q).url))
                    .resizable()
            })
    }
}
