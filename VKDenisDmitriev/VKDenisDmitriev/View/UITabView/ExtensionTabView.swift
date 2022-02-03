//
//  ExtensionTabView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 03.02.2022.
//

import UIKit
import SwiftUI

extension View {
    
    func tab(title: String, image: String? = nil, selectedImage: String? = nil) -> UIKitTabBarView.Tab {
        let tabImage = UIImage(systemName: image ?? "app")
        let selectedImage = UIImage(systemName: (selectedImage ?? image) ?? "app.fill")
        let barItem = UITabBarItem(title: title, image: tabImage, selectedImage: selectedImage)
        return UIKitTabBarView.Tab(view: AnyView(self), barItem: barItem)
    }
}
