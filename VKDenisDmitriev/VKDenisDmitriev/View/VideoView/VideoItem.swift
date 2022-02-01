//
//  VideoItem.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 01.02.2022.
//

import SwiftUI
import Kingfisher

struct VideoItem: View {
    
    var video: Video
    
    var body: some View {
        NavigationLink(
            destination: PhotoView(photo: video.image(.l).url),
            label: {
                ZStack {
                    KFImage(URL(string: video.image(.m).url))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 275, height: 155)
                        .cornerRadius(8)
                        .padding(.trailing, 4)
                    Image(systemName: "play.fill")
                        .foregroundColor(Color.white.opacity(0.75))
                }
                
            })
    }
}
