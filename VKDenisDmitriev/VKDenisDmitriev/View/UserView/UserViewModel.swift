//
//  UserViewModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: User
    let vkService: VKService
    
    init(user: User, vkService: VKService) {
        self.user = user
        self.vkService = vkService
    }
    
    init(vkService: VKService) {
        self.user = User()
        self.vkService = vkService
    }
    
    func fetchUser() {
        vkService.user(for: user.id) { [weak self] result in
            guard let self = self else { return }
            self.user = result
        }
    }
    
}

