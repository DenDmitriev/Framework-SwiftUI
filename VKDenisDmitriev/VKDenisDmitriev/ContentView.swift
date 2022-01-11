//
//  ContentView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 11.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    
    private let padding = UIScreen.main.bounds.size.width/32
    
    var body: some View {
        VStack {
            Image("VKlogo")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width/4, height: UIScreen.main.bounds.size.width/4)
                .padding(.top, UIScreen.main.bounds.size.height/16)
            
            VStack {
                HStack {
                    Text("Login")
                        .frame(maxWidth: UIScreen.main.bounds.size.width/4, alignment: .trailing)
                    TextField("Login", text: $login)
                        .padding(padding)
                        .background(Color.white)
                        .cornerRadius(padding)
                }
                .padding(.bottom, padding/4)
                
                HStack {
                    Text("Password")
                        .frame(maxWidth: UIScreen.main.bounds.size.width/4, alignment: .trailing)
                    SecureField("Password", text: $password)
                        .padding(padding)
                        .background(Color.white)
                        .cornerRadius(padding)
                }
                .padding(.bottom, padding)
                
                Button {
                    print("Hello \(login) with password \(password)")
                } label: {
                    Text("Login")
                        .font(.title2)
                        .bold()
                }
                .padding(padding)
                .accentColor(.white)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(padding)
                .disabled(login.isEmpty || password.isEmpty)
                
            }
            .padding(padding)
            
            Spacer()
        }
        .background(Color.black.opacity(0.1))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
