//
//  ContentView.swift
//  Shared
//
//  Created by Denis Dmitriev on 28.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    @State @CodingStyle var textFromated: String = ""
    
    var body: some View {
        VStack {
            TextField("Insert your text", text: $text)
                .onChange(of: text, perform: { text in
                    textFromated = text
                })
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .multilineTextAlignment(.center)
            Text(textFromated)
                .foregroundColor(.gray)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
