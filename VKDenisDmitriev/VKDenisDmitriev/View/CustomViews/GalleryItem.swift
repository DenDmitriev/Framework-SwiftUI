//
//  GellaryItem.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 17.01.2022.
//

import SwiftUI

struct GalleryItem: View {
    
    var image: Photo
    
    var body: some View {
        NavigationLink(
            destination: PhotoView(photo: image.image),
            label: {
                image.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 155, height: 155)
                    .cornerRadius(8)
                    .padding(.leading, 15)
            })
    }
}

struct GellaryItem_Previews: PreviewProvider {
    static var previews: some View {
        GalleryItem(image: photos[0])
    }
}
