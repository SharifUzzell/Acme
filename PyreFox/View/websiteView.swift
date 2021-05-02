//
//  WebView.swift
//  SwiftUIWebView
//
//  Created by Md. Yamin on 4/25/20.
//  Copyright © 2020 Md. Yamin. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import WebKit

protocol WebViewHandlerDelegate {
    func receivedJsonValueFromWebView(value: [String: Any?])
    func receivedStringValueFromWebView(value: String)
}

struct WebView: UIViewRepresentable, WebViewHandlerDelegate {
   
    func receivedJsonValueFromWebView(value: [String : Any?]) {
        print("JSON value received from web is: \(value)")
    }
    
    func receivedStringValueFromWebView(value: String) {
        print("String value received from web is: \(value)")
    }
    
    @ObservedObject var viewModel: WebViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(self.makeCoordinator(), name: "iOSNative")
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        
        //remove after debugging...
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        webView.load(URLRequest(url: URL(string: viewModel.url)!))
        print("UUUUUUUUUUUUUUUUUUUUU " + viewModel.url)
        return webView
    }
    
    
    func updateUIView(_ webView: WKWebView, context: Context) {
    }
    
    class Coordinator : NSObject, WKNavigationDelegate {
        var parent: WebView
        var valueSubscriber: AnyCancellable? = nil
        var webViewNavigationSubscriber: AnyCancellable? = nil
        var delegate: WebViewHandlerDelegate?
        
        init(_ uiWebView: WebView) {
            self.parent = uiWebView
        }
        
        deinit {
            valueSubscriber?.cancel()
            webViewNavigationSubscriber?.cancel()
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Get the title of loaded webcontent
            webView.evaluateJavaScript("document.title") { (response, error) in
                if let error = error {
                    print("Error getting title")
                    print(error.localizedDescription)
                }
                
                guard let title = response as? String else {
                    return
                }
                
                self.parent.viewModel.showWebTitle.send(title)
                
                guard let url = webView.url else {
                    return
                }
              
                print("OUHFOUSDOHSOFHOSFHIOUSHJFOSHFOFHOSHFOUIH    " + url.absoluteString)
                
            }
            
            valueSubscriber = parent.viewModel.valuePublisher.receive(on: RunLoop.main).sink(receiveValue: { value in
                let javascriptFunction = "valueGotFromIOS(\(value));"
                webView.evaluateJavaScript(javascriptFunction) { (response, error) in
                    if let error = error {
                        print("Error calling javascript:valueGotFromIOS()")
                        print(error.localizedDescription)
                    } else {
                        print("Called javascript:valueGotFromIOS()")
                    }
                }
            })
            
            // Page loaded so no need to show loader anymore
            self.parent.viewModel.showLoader.send(false)
        }
        
        /* Here I implemented most of the WKWebView's delegate functions so that you can know them and
         can use them in different necessary purposes */
        
        func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
            // Hides loader
            parent.viewModel.showLoader.send(false)
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            // Hides loader
            parent.viewModel.showLoader.send(false)
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            parent.viewModel.url = webView.url!.absoluteString
            // Shows loader
            parent.viewModel.showLoader.send(true)
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            // Shows loader
            parent.viewModel.showLoader.send(true)
            self.webViewNavigationSubscriber = self.parent.viewModel.webViewNavigationPublisher.receive(on: RunLoop.main).sink(receiveValue: { navigation in
                switch navigation {
                case .backward:
                    if webView.canGoBack {
                        webView.goBack()
                    }
                case .forward:
                    if webView.canGoForward {
                        webView.goForward()
                    }
                case .reload:
                    webView.reload()
                case .load:
                    webView.load(URLRequest(url: URL(string: self.parent.viewModel.url)!))
                    print("IIIIIIIIIIIIIIIIIIIII  " +  self.parent.viewModel.url)
                }
                
            })
        }
        
        // This function is essential for intercepting every navigation in the webview
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            // Suppose you don't want your user to go a restricted site
            // Here you can get many information about new url from 'navigationAction.request.description'
            decisionHandler(.allow)
        }
    }
}

// MARK: - Extensions
extension WebView.Coordinator: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // Make sure that your passed delegate is called
        if message.name == "iOSNative" {
            if let body = message.body as? [String: Any?] {
                delegate?.receivedJsonValueFromWebView(value: body)
            } else if let body = message.body as? String {
                delegate?.receivedStringValueFromWebView(value: body)
            }
        }
    }
}

