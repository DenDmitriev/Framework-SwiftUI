//
//  UserViewModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 04.02.2022.
//

import Foundation


class UserViewModel: ObservableObject {
    
    @Published var user: User
    let vkService: VKService
    
    init(user: User) {
        self.vkService = VKService()
        self.user = user
    }
}
