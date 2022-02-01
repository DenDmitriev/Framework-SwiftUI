//
//  FriendsList.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI

struct FriendsList: View {
    
    @ObservedObject var viewModel: FriendsListModel
    
    init(viewModel: FriendsListModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            ScrollViewReader(content: { proxy in
                List {
                    ForEach(viewModel.indexs, id: \.self) { letter in
                        Section(header: Text(letter)) {
                            ForEach(viewModel.dictionary[letter]!, id: \.id) { user in
                                NavigationLink(
                                    destination: UserView(viewModel: UserViewModel(user: user, vkService: VKService()))
                                        .navigationBarTitle(user.name),
                                    label: {
                                        UserCell(user: user)
                                    })
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchFriends()
                }
                .overlay(IndexSection(viewModel: viewModel, proxy: proxy))
            })
        }
    }
}
