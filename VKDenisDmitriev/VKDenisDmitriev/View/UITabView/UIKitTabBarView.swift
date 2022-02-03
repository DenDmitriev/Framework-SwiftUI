//
//  TabBarView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 03.02.2022.
//

import SwiftUI
import UIKit

struct UIKitTabBarView: View {
    var viewControllers: [UIHostingController<AnyView>]
    var selectedIndex: Binding<Int>?
    @State private var fallbackSelectedIndex: Int = 0
    
    init(selectedIndex: Binding<Int>? = nil, @TabBuilder _ views: () -> [Tab]) {
        self.viewControllers = views().map {
            let host = UIHostingController(rootView: $0.view)
            host.tabBarItem = $0.barItem
            return host
        }
        self.selectedIndex = selectedIndex
    }
    
    var body: some View {
        TabBarController(controllers: viewControllers, selectedIndex: selectedIndex ?? $fallbackSelectedIndex)
            .edgesIgnoringSafeArea(.all)
    }
    
    struct Tab {
        var view: AnyView
        var barItem: UITabBarItem
    }
}

@_functionBuilder
struct TabBuilder {
    static func buildBlock(_ items: UIKitTabBarView.Tab...) -> [UIKitTabBarView.Tab] {
        items
    }
}


