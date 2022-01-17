//
//  UserTabView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI

struct UserTabView: View {
    var body: some View {
        TabView {
            VStack {
                UserView(user: User(id: 0, name: "Geralt", photo: Image("geralt")))
                Spacer()
            }
            .tabItem {
                Label("User", systemImage: "person")
            }
            .navigationBarHidden(true)
            
            VStack {
                Text("NewsList")
            }
            .tabItem {
                Label("News", systemImage: "newspaper")
            }
            .navigationBarHidden(true)
            
            VStack {
                FriendsList()
            }
            .tabItem {
                Label("Friends", systemImage: "person.2")
            }
            .navigationBarHidden(true)
            
            VStack {
                GroupList()
            }
            .tabItem {
                Label("Groups", systemImage: "person.3")
            }
            .navigationBarHidden(true)
        }
    }
}

struct UserTabView_Previews: PreviewProvider {
    static var previews: some View {
        UserTabView()
    }
}
