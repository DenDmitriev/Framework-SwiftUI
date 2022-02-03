//
//  ContentView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var session = Session.shared
    
    var body: some View {
        
        switch session.isUserAutorizated {
        case false:
            AuthorizationView(viewModel: AuthorizationViewModel())
        case true:
            //UserTabView()
            UIKitTabBarExampleView()
        }
        
    }
}
