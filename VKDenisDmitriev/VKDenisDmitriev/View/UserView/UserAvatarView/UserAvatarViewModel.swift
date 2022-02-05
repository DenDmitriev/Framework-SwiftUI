//
//  UserViewModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import Foundation

class UserAvatarViewModel: ObservableObject {
    
    @Published var user: User
    let vkService: VKService
    
    init(user: User) {
        self.user = user
        self.vkService = VKService()
    }
    
    func fetchUser() {
        vkService.user(for: user.id) { [weak self] result in
            guard let self = self else { return }
            self.user = result
        }
    }
    
}

