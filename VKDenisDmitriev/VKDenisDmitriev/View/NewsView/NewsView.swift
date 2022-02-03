//
//  NewsView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 30.01.2022.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        List(viewModel.posts, id: \.id) { post in
            VStack(alignment: .leading) {
                AuthorView(author: post.author, date: post.date)
                if let text = post.text { TextView(text: text) }
                if let photos = post.photos { GalleryRow(photos: photos) }
                if let videos = post.videos { VideoRow(videos: videos) }
                SocialButtonsView(post: post)
            }
        }
        .onAppear {
            viewModel.fetchNews()
        }
    }
}
