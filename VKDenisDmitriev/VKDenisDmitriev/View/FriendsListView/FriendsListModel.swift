//
//  FriendsListModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import Foundation
import RealmSwift

class FriendsListModel: ObservableObject {
    
    let vkService: VKService
    let realmService: RealmService
    var indexService: IndexService
    private var notification: NotificationToken?
    
    //@Published var friends: [User] = []
    private lazy var friends: Results<User>? = try? realmService.get(User.self, config: Realm.Configuration(deleteRealmIfMigrationNeeded: true))
    var detacbleUsers: [User] { friends?.map { $0.detached() } ?? [] }
    
    init() {
        self.vkService = VKService()
        self.indexService = IndexService(users: [])
        self.realmService = RealmService()
        subscribeDatabaseChanges()
    }
    
    func fetchFriends() {
        vkService.friends { [weak self] result in
            guard let self = self else { return }
            //self.friends = result
            try? self.realmService.save(items: result, config: Realm.Configuration(deleteRealmIfMigrationNeeded: true), update: .modified)
            self.indexService = IndexService(users: self.detacbleUsers)
        }
    }
    
    func subscribeDatabaseChanges() {
        notification = friends?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
}
