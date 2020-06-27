//
//  WebView.swift
//  Hacker News
//
//  Created by Kevin Torres on 27/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlSafe = url {
            if let url = URL(string: urlSafe) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
