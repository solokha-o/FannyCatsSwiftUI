//
//  WebView.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 08.10.2020.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    //create link for request
    let link: String
    //set to view WKWebView
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    //update view after load request
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let url = URL(string: link) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

