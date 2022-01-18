//
//  Modifier.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 13.01.2022.
//

import Foundation
import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        ZStack{
            Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius)
            content.clipShape(Circle())
        }
    }
}
