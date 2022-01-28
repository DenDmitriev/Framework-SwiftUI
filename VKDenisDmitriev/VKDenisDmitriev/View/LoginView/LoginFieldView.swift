//
//  LoginFieldView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 14.01.2022.
//
import Foundation
import SwiftUI

struct LoginFieldView: View {
    
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            Text("Welcome, \(login)")
                .padding(.bottom)
            TextField("Login", text: $login)
                .padding(UIScreen.main.bounds.size.width/32)
                .background(Color.white.opacity(0.5))
                .cornerRadius(UIScreen.main.bounds.size.width/32)
            SecureField("Password", text: $password)
                .padding(UIScreen.main.bounds.size.width/32)
                .background(Color.white.opacity(0.5))
                .cornerRadius(UIScreen.main.bounds.size.width/32)
        }
    }
    
}

struct AutorisationView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginFieldView(login: .constant(""), password: .constant(""))
            .background(Color.red
            )
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
