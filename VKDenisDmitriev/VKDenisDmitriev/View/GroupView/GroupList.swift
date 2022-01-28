//
//  GroupList.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 15.01.2022.
//

import SwiftUI
import RealmSwift

struct GroupList: View {
    
    @ObservedObject var viewModel: GroupListModel
    
    init() {
        self.viewModel = GroupListModel()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Groups")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                Spacer()
            }
            List(viewModel.detachebleGroups) { group in
                GroupCell(group: group)
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct GroupList_Previews: PreviewProvider {
    static var previews: some View {
        GroupList()
    }
}
