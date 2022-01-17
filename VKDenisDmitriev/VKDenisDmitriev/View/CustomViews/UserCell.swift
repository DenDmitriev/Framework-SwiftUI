//
//  UserCell.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 13.01.2022.
//

import Foundation
import SwiftUI

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        HStack {
            user.photo
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                
            Text(user.name)
                .font(.title3)
            Spacer()
        }
        .frame(width: 300, height: 70)
    }
}


struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: User(id: 1, name: "Геральт", photo: Image("geralt")))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
