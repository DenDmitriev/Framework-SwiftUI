//
//  Format.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 31.01.2022.
//

import Foundation

final class Format {
    
    static let shared = Format()
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    
}
