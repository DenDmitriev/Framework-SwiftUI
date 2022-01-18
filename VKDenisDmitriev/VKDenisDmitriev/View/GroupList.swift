//
//  GroupList.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 15.01.2022.
//

import SwiftUI

struct GroupList: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Groups")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                Spacer()
            }
            List(groups) { group in
                GroupCell(group: group)
            }
        }
    }
}

struct GroupList_Previews: PreviewProvider {
    static var previews: some View {
        GroupList()
    }
}
