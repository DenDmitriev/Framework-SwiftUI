//
//  ContentView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowUserTabView = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if !shouldShowUserTabView {
                    AuthorizationView(isUserAuthorizated: $shouldShowUserTabView, viewModel: AuthorizationViewModel())
                }
                
                NavigationLink(destination: UserTabView(), isActive: $shouldShowUserTabView) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
    }
}
