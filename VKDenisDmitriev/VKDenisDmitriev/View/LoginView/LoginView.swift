//
//  ContentView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 11.01.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var showIncorrentCredentialsWarning = false
    
    @Binding var isAutorisation: Bool
    
    private let padding = UIScreen.main.bounds.size.width/32
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    Image("VKlogo")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width/4, height: UIScreen.main.bounds.size.width/4)
                        .padding(.top, UIScreen.main.bounds.size.height/16)
                    
                    VStack {

                        LoginFieldView(login: $login, password: $password)
                        
                        if !login.isEmpty && !password.isEmpty {
                            Button {
                                showIncorrentCredentialsWarning = !checkLogin(for: login, password: password)
                                isAutorisation = !showIncorrentCredentialsWarning
                            } label: {
                                Text("Login")
                                    .bold()
                            }
                            .padding(padding)
                            .accentColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(padding)
                            .disabled(login.isEmpty || password.isEmpty)
                        }
                    }
                    .padding(padding)
                    
                    Spacer()
                }
                .ignoresSafeArea()
                .alert(isPresented: $showIncorrentCredentialsWarning, content: {
                    Alert(title: Text("Error"), message: Text("Invalid login or password"), dismissButton: .default(Text("Ok"), action: {
                        print("autorisation fail")
                    }))
                })
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
    
    private func checkLogin(for login: String, password: String) -> Bool {
        return login == "Admin" && password == "admin"
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
