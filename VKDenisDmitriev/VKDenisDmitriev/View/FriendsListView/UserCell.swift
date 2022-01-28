//
//  UserCell.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 13.01.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.photo(.px100)))
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title3)
                Text(user.status)
                    .foregroundColor(user.color)
                    .font(.caption)
            }
            Spacer()
        }
        .frame(width: 300, height: 70)
    }
}


//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell(user: User(id: 1, name: "Геральт", photo: "geralt"))
//            .previewLayout(PreviewLayout.sizeThatFits)
//    }
//}
