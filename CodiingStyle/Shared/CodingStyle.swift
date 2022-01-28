//
//  CodingStyle.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 28.01.2022.
//

import Foundation

enum Style {
    case camelCase, snakeCase, kebabCase
}

@propertyWrapper struct CodingStyle {
    
    var wrappedValue: String {
        get {
            switch style {
            case .camelCase:
                return camelCase(text: text)
            case .snakeCase:
                return snakeCase(text: text)
            case .kebabCase:
                return kebabCase(text: text)
            }
        }
        set {
            text = newValue
        }
    }
    private var text: String
    
    private var style: Style {
        let camels = text.filter { $0.isUppercase }.count
        let snakes = text.filter { $0 == "_" }.count
        let kebabs = text.filter { $0 == "-" }.count
        let dict: [Style:Int] = [.camelCase : camels, .snakeCase : snakes, .kebabCase : kebabs]
        let style = dict.sorted { $1.value < $0.value  }.first?.key ?? .camelCase
        return style
    }
    
    init(wrappedValue: String) {
        self.text = wrappedValue
    }
    
    
    
    func camelCase(text: String) -> String {
        let array = text.components(separatedBy: " ")
        let camelCaseArray = array.map { $0.prefix(1).uppercased() + $0.dropFirst() }
        let camelCaseText = camelCaseArray.joined()
        return camelCaseText.prefix(1).lowercased() + camelCaseText.dropFirst()
    }
    
    func snakeCase(text: String) -> String {
        return text.lowercased().replacingOccurrences(of: " ", with: "_")
    }
    
    func kebabCase(text: String) -> String {
        return text.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}
