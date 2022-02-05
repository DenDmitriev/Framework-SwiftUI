//
//  PhotoGalleryView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 04.02.2022.
//

import SwiftUI
import Kingfisher

struct PhotoGalleryView: View {
    
    @ObservedObject var viewModel: PhotoGalleryViewModel
    
    var columns: Int
    private var gridItems: [GridItem]
    private let spacing: CGFloat = 2
    
    init(viewModel: PhotoGalleryViewModel, columns: Int) {
        self.viewModel = viewModel
        self.columns = columns
        self.gridItems = Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: spacing), count: columns)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Фотографии")
                .font(.title2)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 4, trailing: 4))
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    LazyVGrid(columns: gridItems, alignment: .center, spacing: spacing) {
                        ForEach(viewModel.photos, id: \.id) { photo in
                            PhotoItemView(photo: photo)
                                .scaledToFill()
                                .frame(width: readSizeItem(proxy), height: readSizeItem(proxy))
                                .aspectRatio(1, contentMode: .fill)
                                .clipped()
                        }
                    }
                    .onAppear {
                        viewModel.fetchPhotos(for: viewModel.userID, from: Album.Default.wall.rawValue)
                    }
                }
            }
        }
    }
    
    private func readSizeItem(_ proxy: GeometryProxy) -> CGFloat {
        let columns = CGFloat(self.columns)
        return (proxy.size.width - ((columns - 1) * spacing))/columns
    }
}
