//
//  SectionIndexList.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 18.01.2022.
//

import SwiftUI

struct SectionIndexView: View {
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                ForEach(alphabet, id: \.self) { letter in
                    Button(action: {
                        print("letter = \(letter)")
                    }, label: {
                        Text(letter)
                            .font(.headline)
                            .padding(.trailing, 8)
                            .foregroundColor(.blue)
                    })
                }
            }
        }
    }
}

struct SectionIndexList_Previews: PreviewProvider {
    static var previews: some View {
        SectionIndexView()
    }
}
