//
//  IndexSection.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 18.01.2022.
//

import SwiftUI

struct IndexSection: View {
    
    let viewModel: FriendsListModel
    let proxy: ScrollViewProxy
    @GestureState private var dragLocation: CGPoint = .zero
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                ForEach(viewModel.indexs, id: \.self) { letter in
                    Text(letter)
                        .font(.caption)
                        .padding(.trailing, 8)
                        .foregroundColor(.blue)
                        .background(dragObserver(letter: letter))
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .updating($dragLocation, body: { value, state, _ in
                    state = value.location
                })
        )
    }
    
    func dragObserver(letter: String) -> some View {
        GeometryReader { geometry in
            dragObserver(geometry: geometry, letter: letter)
        }
    }
    
    func dragObserver(geometry: GeometryProxy, letter: String) -> some View {
        if geometry.frame(in: .global).contains(dragLocation) {
            DispatchQueue.main.async {
                proxy.scrollTo(letter, anchor: .center)
            }
        }
        return Rectangle().fill(Color.clear)
    }
}
