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
                NavigationView {
                    UserView(viewModel: UserViewModel(user: User(for: Int(Session.shared.id) ?? 0)))
                        .navigationBarTitle("Me")
                    Spacer()
                }
            }
            .tabItem {
                Label("User", systemImage: "person")
            }
            
            VStack {
                NavigationView {
                    NewsView(viewModel: NewsViewModel())
                        .navigationBarTitle("News feed")
                }
            }
            .tabItem {
                Label("News", systemImage: "newspaper")
            }
            
            VStack {
                NavigationView {
                    FriendsList(viewModel: FriendsListModel())
                        .navigationBarTitle("Friends")
                }
                
            }
            .tabItem {
                Label("Friends", systemImage: "person.2")
            }
            
            VStack {
                NavigationView {
                    GroupList()
                        .navigationBarTitle("Groups")
                }
            }
            .tabItem {
                Label("Groups", systemImage: "person.3")
            }
        }
    }
}

struct UserTabView_Previews: PreviewProvider {
    static var previews: some View {
        UserTabView()
    }
}
