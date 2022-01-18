//
//  ContentView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowUserView = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isAutorisation: $shouldShowUserView)
                NavigationLink(destination: UserTabView(), isActive: $shouldShowUserView) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
    }
}
