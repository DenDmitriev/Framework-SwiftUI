//
//  RealmService.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 26.01.2022.
//

import Foundation
import RealmSwift

protocol AnyRealmService {
    func save<T: Object>(items: [T], config: Realm.Configuration, update: Realm.UpdatePolicy) throws
    func get<T: Object>(_ type: T.Type, config: Realm.Configuration) throws -> Results<T>
    func get<T: Object>(_ type: T.Type, config: Realm.Configuration) throws -> [T]
    func delete<T: Object>(item: T, config: Realm.Configuration) throws
}

class RealmService: AnyRealmService {
    func save<T: Object>(items: [T], config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true), update: Realm.UpdatePolicy) throws {
        let realm = try Realm(configuration: config)
        print(config.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
        }
    }
    
    func get<T: Object>(_ type: T.Type, config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)) throws -> Results<T> {
        let realm = try Realm(configuration: config)
        print(config.fileURL ?? "")
        return realm.objects(type)
    }
    
    func get<T: Object>(_ type: T.Type, config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)) throws -> [T] {
        let realm = try Realm(configuration: config)
        print(config.fileURL ?? "")
        return Array(realm.objects(type))
    }
    
    func delete<T: Object>(item: T, config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)) throws {
        let realm = try Realm(configuration: config)
        print(config.fileURL ?? "")
        try realm.write {
            realm.delete(item)
        }
    }
}
