//
//  UserView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI

struct UserView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(
                    destination: PhotoView(photo: user.photo),
                    label: {
                        user.photo
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 150, height: 150)
                    })
                
                VStack {
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                }
                .padding(.top, 8)
                .frame(height: 100)
                
                Spacer()
            }
            .padding()
            
            GalleryRow(photos: photos)
            
            Spacer()
        }
        .navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(id: 0, name: "Geralt", photo: Image("geralt")))
    }
}
