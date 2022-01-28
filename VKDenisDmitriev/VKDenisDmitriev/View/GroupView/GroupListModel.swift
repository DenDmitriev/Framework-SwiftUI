//
//  GroupListModel.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 24.01.2022.
//

import Foundation
import RealmSwift

class GroupListModel: ObservableObject {
    
    let vkService: VKService
    let realmService: AnyRealmService
    
    private lazy var groups: Results<Group>? = try? realmService.get(
        Group.self,
        config: Realm.Configuration(deleteRealmIfMigrationNeeded: true))
    var detachebleGroups: [Group] {
        groups?.map { $0.detached() } ?? []
    }

    private var notification: NotificationToken?
    //let objectWillChange = ObjectWillChangePublisher()
    
    init() {
        self.vkService = VKService()
        self.realmService = RealmService()
        subscribeDatabaseChanges()
    }
    
    func fetch() {
        vkService.groups(for: Int(Session.shared.id) ?? 1) { [weak self] groups in
            guard let self = self else { return }
            try? self.realmService.save(items: groups, config: Realm.Configuration(deleteRealmIfMigrationNeeded: true), update: .modified)
            //self.objectWillChange.send()
        }
    }
    
    func subscribeDatabaseChanges() {
        notification = groups?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
