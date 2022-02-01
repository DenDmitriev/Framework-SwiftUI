//
//  AuthorizationView.swift
//  VKDenisDmitriev
//
//  Created by Denis Dmitriev on 21.01.2022.
//

import SwiftUI
import WebKit

struct AuthorizationView: View, UIViewRepresentable {
    
    var viewModel = AuthorizationViewModel()
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.navigationDelegate = viewModel
        guard let url = viewModel.url else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}
