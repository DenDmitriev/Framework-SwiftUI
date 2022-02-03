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
            List(viewModel.detachebleGroups) { group in
                GroupCell(group: group)
            }
            .onAppear {
                viewModel.fetchGroups()
            }
        }
    }
}

struct GroupList_Previews: PreviewProvider {
    static var previews: some View {
        GroupList()
    }
}
