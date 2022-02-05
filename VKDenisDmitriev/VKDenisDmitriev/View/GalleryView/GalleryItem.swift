//
//  GellaryItem.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 17.01.2022.
//

import SwiftUI
import Kingfisher

struct GalleryItem: View {
    
    var photo: Photo
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        NavigationLink(
            destination: PhotoView(photo: photo.photo(.z).url),
            label: {
                KFImage(URL(string: photo.photo(.q).url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width ?? 150, height: height ?? 150)
                    .cornerRadius(8)
                    .padding(.trailing, 4)
            })
    }
}

//struct GellaryItem_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryItem(image: photos[0])
//    }
//}
