//
//  UserImage.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI

struct UserImage: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 200
    
    var photo: Image
    
    
    var body: some View {
        photo
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}

struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(photo: Image("geralt"))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
