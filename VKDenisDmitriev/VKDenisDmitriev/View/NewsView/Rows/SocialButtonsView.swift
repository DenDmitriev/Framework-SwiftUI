//
//  SocialButtonsView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 31.01.2022.
//

import SwiftUI

struct SocialButtonsView: View {
    
    var post: Post
    
    var body: some View {
        HStack() {
            SocialButton(imageEnabled: Image(systemName: "heart.fill"), imageDisabled: Image(systemName: "heart"), count: post.likes?.count)
            SocialButton(imageEnabled: Image(systemName: "message.fill"), imageDisabled: Image(systemName: "message"), count: post.likes?.count)
            SocialButton(imageEnabled: Image(systemName: "arrowshape.turn.up.right.fill"), imageDisabled: Image(systemName: "arrowshape.turn.up.right"), count: post.likes?.count)
            //Spacer()
            SocialButton(imageEnabled: Image(systemName: "eye.fill"), imageDisabled: Image(systemName: "eye"), count: post.likes?.count)
        }
        
    }
}
