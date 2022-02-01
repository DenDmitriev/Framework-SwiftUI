//
//  SocialButton.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 31.01.2022.
//

import SwiftUI

struct SocialButton: View {
    
    var imageEnabled: Image
    var imageDisabled: Image
    var count: Int?
    
    @State var wasPressed: Bool = false
    
    var body: some View {
        HStack {
            (wasPressed ? imageEnabled : imageDisabled)
                .scaleEffect(wasPressed ? 1 : 0.9)
                .animation(.interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 10))
                .onTapGesture {
                    wasPressed.toggle()
                }
            switch count {
            case 0:
                EmptyView()
            case nil:
                EmptyView()
            default:
                Text(String(count ?? 0))
                    .font(.caption)
            }
        }
        .foregroundColor(wasPressed ? .blue : .gray)
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        .background(Color.gray.opacity(0.2))
        .cornerRadius(50)
        
    }
}

struct SocialButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialButton(imageEnabled: Image(systemName: "heart.fill"), imageDisabled: Image(systemName: "heart"), count: 69, wasPressed: false)
            .previewLayout(.sizeThatFits)
    }
}
