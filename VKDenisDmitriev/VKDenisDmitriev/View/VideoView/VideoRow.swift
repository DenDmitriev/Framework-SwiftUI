//
//  VideoRow.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 01.02.2022.
//

import SwiftUI

struct VideoRow: View {
    
    var videos: [Video]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(videos, id: \.id) { video in
                        VideoItem(video: video)
                    }
                }
            })
            .frame(height: 175)
        }
    }
}

//struct VideoRow_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoRow()
//    }
//}
