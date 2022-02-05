//
//  GalleryRow.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 17.01.2022.
//

import SwiftUI

struct GalleryRow: View {
    
    var photos: [Photo]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(photos, id: \.id) { photo in
                        GalleryItem(photo: photo)
                    }
                }
            })
            .frame(height: 175)
        }
    }
}

//struct GalleryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryRow(photos: photos)
//    }
//}
