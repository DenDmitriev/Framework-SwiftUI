//
//  UserAvatarView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 04.02.2022.
//

import SwiftUI
import Kingfisher

struct UserAvatarView: View {
    
    @ObservedObject var viewModel: UserAvatarViewModel
    
    var body: some View {
        
        HStack {
            NavigationLink(
                destination: PhotoView(photo: viewModel.user.photo(.px400)),
                label: {
                    KFImage(URL(string: viewModel.user.photo(.px200)))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                })
            
            VStack(alignment: .leading) {
                Text(viewModel.user.name)
                    .font(.title)
                    .fontWeight(.medium)
                Text(viewModel.user.status)
                    .foregroundColor(viewModel.user.color)
                    .font(.caption)
                Text(viewModel.user.bdate)
                    .font(.footnote)
                Spacer()
            }
            .onAppear{
                viewModel.fetchUser()
            }
            .padding(.top, 8)
            .frame(height: 100)
            Spacer()
        }
    }
}
