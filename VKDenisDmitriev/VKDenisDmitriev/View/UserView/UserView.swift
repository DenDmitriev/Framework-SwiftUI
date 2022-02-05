//
//  UserView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI
import Kingfisher

struct UserView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        VStack {
            UserAvatarView(viewModel: UserAvatarViewModel(user: viewModel.user))
                .padding()
            Divider()
                .padding(.leading)
            PhotoGalleryView(viewModel: PhotoGalleryViewModel(userID: viewModel.user.id), columns: 3)
        }
    }
}
