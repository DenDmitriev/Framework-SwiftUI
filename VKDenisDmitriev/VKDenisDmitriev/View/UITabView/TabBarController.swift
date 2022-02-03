//
//  TabViewController.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 03.02.2022.
//

import UIKit
import SwiftUI

struct TabBarController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    @Binding var selectedIndex: Int
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = context.coordinator
        tabBarController.selectedIndex = 0
        return tabBarController
    }
    
    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        tabBarController.selectedIndex = selectedIndex
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(tabBarController: self)
    }
    
}

class Coordinator: NSObject, UITabBarControllerDelegate {
    
    let tabBarController: TabBarController
    
    init(tabBarController: TabBarController) {
        self.tabBarController = tabBarController
    }
}
