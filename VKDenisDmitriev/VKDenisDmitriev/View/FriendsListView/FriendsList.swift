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
            HStack {
                Text("Friends")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                Spacer()
            }

            ScrollViewReader(content: { proxy in
                List {
                    ForEach(viewModel.indexService.indexs, id: \.self) { letter in
                        Section(header: Text(letter)) {
                            ForEach(viewModel.indexService.dictionary[letter]!, id: \.id) { user in
                                NavigationLink(
                                    destination: UserView(viewModel: UserViewModel(user: user, vkService: VKService())),
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
                .overlay(IndexSection(indexService: viewModel.indexService, proxy: proxy))
            })
        }
    }
}

//struct FriendsList_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsList()
//    }
//}
