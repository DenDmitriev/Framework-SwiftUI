//
//  UserCellView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 13.01.2022.
//

import Foundation
import SwiftUI

struct UserCellView: View {
    var body: some View {
        ZStack() {
            Image("geralt")
                .resizable()
                .scaledToFill()
                .modifier(CircleShadow(shadowColor: Color.gray, shadowRadius: 10))
                .frame(width: Size.avatar, height: Size.avatar)
                .alignmentGuide(HorizontalAlignment.center, computeValue: { $0[.trailing] })
            Text("Геральт из Ривии")
                .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .font(.title2)
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                .alignmentGuide(HorizontalAlignment.center, computeValue: { $0[.leading] })
            Text("Профессиональный охотник на монстров")
                .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .font(.caption)
                .foregroundColor(.gray)
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.top] })
                .alignmentGuide(HorizontalAlignment.center, computeValue: { $0[.leading] })
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: 100)
        .padding()
    }
}


struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}
