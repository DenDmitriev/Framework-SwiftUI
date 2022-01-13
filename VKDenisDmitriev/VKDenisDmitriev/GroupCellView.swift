//
//  GroupCellView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 13.01.2022.
//

import Foundation
import SwiftUI

struct GroupCellView: View {
    var body: some View {
        HStack {
            Image("aretuza")
                .resizable()
                .scaledToFill()
                .modifier(CircleShadow(shadowColor: Color.gray, shadowRadius: 10))
                .frame(width: Size.group, height: Size.group)
            VStack(alignment: .leading, spacing: 8) {
                Text("Академия Аретуза")
                    .font(.title2)
                Text("Школа магии для юных чародеек")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 100)
        .padding()
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView()
    }
}
