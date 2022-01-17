//
//  FriendsList.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import SwiftUI

struct FriendsList: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Friends")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                Spacer()
            }
            
            let indexService = IndexService(users: users)

            List {
                ForEach(indexService.indexs, id: \.self) { letter in
                    Section(header: Text(letter)) {
                        ForEach(indexService.dictionary[letter]!, id: \.id) { user in
                            NavigationLink(
                                destination: UserView(user: user),
                                label: {
                                    UserCell(user: user)
                                })
                        }
                    }
                }
            }
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
