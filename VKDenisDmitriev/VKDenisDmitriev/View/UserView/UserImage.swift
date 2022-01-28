//
//  UserImage.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI
import Kingfisher

struct UserImage: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 200
    
    var photo: String
    
    
    var body: some View {
        KFImage(URL(string: photo))
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}

struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(photo: "https://www.looper.com/img/gallery/why-geralts-new-armor-in-the-witcher-season-2-means-more-than-you-think/intro-1639348458.jpg")
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
