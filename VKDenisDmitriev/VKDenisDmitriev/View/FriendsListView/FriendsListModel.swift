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
    //lazy var indexService: IndexService = IndexService(users: self.detacbleUsers)
    
    private var notification: NotificationToken?
    
    private lazy var friends: Results<User>? = try? realmService.get(
        User.self,
        config: Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    )
    var detacbleUsers: [User] {
        friends?.map { $0.detached() } ?? []
    }
    
    var indexs: [String] {
        Array(dictionary.keys.sorted().map({ $0.uppercased() }))
    }
    
    var dictionary: [String:[User]] {
        var dictinary: [String:[User]] = [:]
        for user in detacbleUsers {
            let index = String(user.name.prefix(1))
            if dictinary[index]?.isEmpty ?? true  {
                dictinary[index] = [user]
            } else {
                dictinary[index]?.append(user)
            }
        }
        return dictinary
    }
    
    init() {
        self.vkService = VKService()
        self.realmService = RealmService()
        subscribeDatabaseChanges()
    }
    
    func fetchFriends() {
        vkService.friends { [weak self] users in
            guard let self = self else { return }
            try? self.realmService.save(
                items: users,
                config: Realm.Configuration(deleteRealmIfMigrationNeeded: true),
                update: .modified
            )
        }
    }
    
    func subscribeDatabaseChanges() {
        notification = friends?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
}
