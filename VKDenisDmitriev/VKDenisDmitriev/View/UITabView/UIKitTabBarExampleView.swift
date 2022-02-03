//
//  UIKitTabBarExampleView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 03.02.2022.
//

import SwiftUI

struct UIKitTabBarExampleView: View {
    
    var body: some View {
        
        UIKitTabBarView {
            VStack {
                NavigationView {
                    UserView(viewModel: UserViewModel(user: User(for: Int(Session.shared.id) ?? 0), vkService: VKService()))
                        .navigationBarTitle("Me")
                    Spacer()
                }
            }
            .tab(title: "User", image: "person")
            
            VStack {
                NavigationView {
                    NewsView(viewModel: NewsViewModel())
                        .navigationBarTitle("News feed")
                }
            }
            .tab(title: "News", image: "newspaper")
            
            VStack {
                NavigationView {
                    FriendsList(viewModel: FriendsListModel())
                        .navigationBarTitle("Friends")
                }
                
            }
            .tab(title: "Friends", image: "person.2")
            
            VStack {
                NavigationView {
                    GroupList()
                        .navigationBarTitle("Groups")
                }
            }
            .tab(title: "Groups", image: "person.3")
        }
    }
    
}

