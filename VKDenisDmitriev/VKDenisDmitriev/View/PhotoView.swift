//
//  PhotoView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI

struct PhotoView: View {
    
    var photo: Image
    
    var body: some View {
        photo
            .resizable()
            .scaledToFit()
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photo: Image("geralt"))
    }
}
