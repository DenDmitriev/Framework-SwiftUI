//
//  GroupCellView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 13.01.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    var group: Group
    
    var body: some View {
        HStack {
            KFImage(URL(string: group.photo(.px100)))
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(group.name)
                    .font(.title2)
                Text(group.about ?? "")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(width: 300, height: 100)
    }
}

//struct GroupCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupCell(group: groups[0])
//            .background(Color.green)
//            .previewLayout(PreviewLayout.sizeThatFits)
//    }
//}
