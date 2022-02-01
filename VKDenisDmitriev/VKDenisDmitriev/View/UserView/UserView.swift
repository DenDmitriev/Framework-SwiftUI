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
    @State var isImageScaled: Bool = false
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                /*
                NavigationLink(
                    destination: PhotoView(photo: viewModel.user.photo(.px400)),
                    label: {
                        KFImage(URL(string: viewModel.user.photo(.px200)))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 150, height: 150)
                    })
                */
                KFImage(URL(string: viewModel.user.photo(.px200)))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .scaleEffect(isImageScaled ? 1.5: 1)
                    .animation(.interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 10))
                    .onTapGesture {
                        isImageScaled.toggle()
                    }

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
                .padding(.top, 8)
                .frame(height: 100)
                
                Spacer()
            }
            .onAppear{
                viewModel.fetchUser()
            }
            .padding()
//            GalleryRow(photos: photos)
            Spacer()
        }
    }
}
