import SwiftUI
import WebKit


struct WebKit: UIViewRepresentable{
    let request: URLRequest
    @Binding var isReloading: Bool
    @Binding var boundTitle: String
    @Binding var goBack: Bool
    @Binding var goForward: Bool
    
    func makeUIView(context: UIViewRepresentableContext<WebKit>) -> WKWebView {
        let wv = WKWebView()
        return wv
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        
        if(goBack){
            goBack = false
            if(uiView.backForwardList.backItem != nil){
                uiView.load(URLRequest(url:uiView.backForwardList.backItem!.url))
            }
            
            
        }else if(goForward){
            goForward = false
            if(uiView.backForwardList.forwardItem != nil){
                uiView.load(URLRequest(url:uiView.backForwardList.forwardItem!.url))
            }
        }else if(isReloading){
            isReloading = false
            uiView.reload()
        }else{
//            uiView.evaluateJavaScript("document.title") { (response, error) in
//                if let error = error {
//                    print("Error getting title")
//                    print(error.localizedDescription)
//                }else{
//                    boundTitle = response as! String
//                }
//            }
            
            uiView.load(request)
            
        }
        
    }
}

struct websiteView: View {
    @Binding var Title: String
    @Binding var urlString: String
    @Binding var isReloading: Bool
    @Binding var goBack: Bool
    @Binding var goForward: Bool
    
    var body: some View {
        WebKit(request: URLRequest(url: formatURL(url: urlString.lowercased())), isReloading: $isReloading, boundTitle: $Title, goBack: $goBack, goForward: $goForward)
    }
    
    func formatURL(url: String) -> URL {
        var recievedURL: String = url
        
        if(!url.isEmpty){
            //rudimentary but it works for simple cases where the user only types the last part of
            //a url
            if url.starts(with: "https://www.") || url.starts(with: "http://www."){
                //DO NOTHING, URL IS FINE
            }else if url.starts(with: "www."){
                recievedURL = "https://" + url
            }else{
                recievedURL = "https://www.google.com/search?q=" + url.replacingOccurrences(of: " ", with: "%20")
            }
            
        }
        if URL(string: recievedURL) != nil {
            return URL(string: recievedURL)!
        }else{
            return URL(string: "https://neeva.com")!
        }
    }
    
}



struct websiteView_Previews: PreviewProvider {
    static var previews: some View {
        let url: Binding = .constant("")
        let title: Binding = .constant("Google")
        let bool: Binding = .constant(false)
        let goBack: Binding = .constant(false)
        let goForward: Binding = .constant(false)
        websiteView(Title: title, urlString: url, isReloading: bool, goBack: goBack, goForward: goForward)
    }
}
