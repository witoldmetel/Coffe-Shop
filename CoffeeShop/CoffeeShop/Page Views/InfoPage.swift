//
//  InfoPage.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import SwiftUI
import WebKit

class WebInterfaceDialogs: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration() // The UIKit View
        config.userContentController.add(WebInterfaceDialogs() , name: "alert")
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let url = URL(string: "https://firtman.github.io/coffeemasters/webapp")!
        webView.load(URLRequest(url: url))
        
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        webView.evaluateJavaScript("injectFormData('\(name)')")
    }
}

struct AppTitle: View {
    var body: some View {
        Text("Coffee Masters")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

struct InfoPage: View {
    var body: some View {
        VStack {
                    AppTitle()
                    WebView()
                }
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
