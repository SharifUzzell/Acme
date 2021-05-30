import Foundation
import Combine

class WebViewModel: ObservableObject{
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTitle = PassthroughSubject<String, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
    @Published var url: String = "https://neeva.com"
}

enum WebViewNavigation {
    case backward, forward, reload, load
}

