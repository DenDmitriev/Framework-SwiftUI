//
//  AuthorView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 31.01.2022.
//

import SwiftUI
import Kingfisher

struct AuthorView: View {
    
    var author: Author?
    var date: TimeInterval
    
    var body: some View {
        HStack {
            KFImage(URL(string: author?.photo(.px100) ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/VK.com-logo.svg/192px-VK.com-logo.svg.png"))
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle(), style: FillStyle())
                //.padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
            
            VStack(alignment: .leading) {
                Text(author?.name ?? "Unknown Author")
                    .font(.headline)
                Text(Format.shared.dateFormatter.string(from: Date(timeIntervalSince1970: date)))
                    .font(.caption)
            }
            .padding(.trailing, 8)
        }
    }
}

//struct AuthorView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthorView()
//            .previewLayout(.sizeThatFits)
//    }
//}
