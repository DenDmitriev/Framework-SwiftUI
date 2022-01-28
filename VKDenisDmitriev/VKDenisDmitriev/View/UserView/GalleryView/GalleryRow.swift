//
//  GalleryRow.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 17.01.2022.
//

import SwiftUI

struct GalleryRow: View {
    
    var photos: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(photos, id: \.self) { photo in
                        GalleryItem(image: photo)
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
