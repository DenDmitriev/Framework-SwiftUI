//
//  Author.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 31.01.2022.
//

import Foundation

protocol Author {
    var name: String { get set }
    func photo(_ size: Size) -> String
}
