//
//  PhotoView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {
    
    var photo: String
    
    var body: some View {
        KFImage(URL(string: photo))
            .resizable()
            .scaledToFit()
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGeralt_of_Rivia&psig=AOvVaw2UB4GkT0czuC_9z_E5n35d&ust=1642918984894000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjW9KXcxPUCFQAAAAAdAAAAABAI")
    }
}
