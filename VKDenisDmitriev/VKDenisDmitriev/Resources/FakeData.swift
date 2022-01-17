//
//  FakeData.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import Foundation
import SwiftUI

let users: [User] = [
    User(id: 9, name: "Fringilla", photo: Image("Fringilla")),
    User(id: 8, name: "Cahir", photo: Image("Cahir")),
    User(id: 7, name: "Tissaia", photo: Image("Tissaia")),
    User(id: 6, name: "Dara", photo: Image("Dara")),
    User(id: 5, name: "Triss", photo: Image("Triss")),
    User(id: 4, name: "Jaskier", photo: Image("Jaskier")),
    User(id: 2, name: "Istredd", photo: Image("Istredd")),
    User(id: 3, name: "Filavandrel", photo: Image("Filavandrel")),
    User(id: 1, name: "Vesemir", photo: Image("Vesemir"))
]

let groups: [Group] = [
    Group(id: 1, name: "Cintra", description: "Провинция Нильфгаарда", image: Image("cintra")),
    Group(id: 2, name: "Aretuza", description: "Школа магии для юных чародеек", image: Image("aretuza")),
    Group(id: 3, name: "Temeria", description: "Крупное и могущественное королевство Севера", image: Image("Temeria")),
    Group(id: 4, name: "Redania", description: "Северных королевство с столицей в Третогоре", image: Image("redania")),
    Group(id: 5, name: "Kaedwen", description: "Столицей в Ард Каррайге, управляемый королем Хенсельтом", image: Image("kaedwen")),
    Group(id: 6, name: "Nilfgaard", description: "Суверенное государство со столицей в Нильфгаарде", image: Image("nilfgaard"))
]

var photos: [Photo] {
    var images: [Photo] = []
    for user in users {
        let photo = Photo(id: user.id, url: "", image: user.photo)
        images.append(photo)
    }
    for group in groups {
        let photo = Photo(id: group.id * 10, url: "", image: group.image)
        images.append(photo)
    }
    return images
}
