//
//  ContentView.swift
//  Shared
//
//  Created by Denis Dmitriev on 28.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    var codingStyleService = CodingStyleService()
    
    var body: some View {
        VStack {
            TextField("Insert your text", text: $text)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .multilineTextAlignment(.center)
            Button("format") {
                self.codingStyleService.text = text
                self.text = codingStyleService.text
            }
            .font(.headline)
            .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
