import SwiftUI

struct URLBarView: View {
    @ObservedObject var viewModel: WebViewModel
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Image(systemName: "globe")
                        .padding(.horizontal, 2)
                        .foregroundColor(Color.accentColor)
                    
                    TextField("Enter URL...",text: $viewModel.url, onCommit: {commitURL()})
                        .foregroundColor(Color("TextColor"))
                        .padding(4)
                        .font(.footnote)
                        .keyboardType(.webSearch)
                 
                    Spacer()
                    //Add current text val to bookmarks
                    Button(action:{
                        viewModel.webViewNavigationPublisher.send(.reload)
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size:16))
                            .foregroundColor(Color.accentColor)
                            .padding(.horizontal, 5)
                    }
                }
                .padding(5)
                .cornerRadius(4.0)
                .background(Capsule().strokeBorder(Color("TextColor"), lineWidth: 1.25 ))
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 5)
        }
    }
    
    func commitURL(){
            viewModel.webViewNavigationPublisher.send(WebViewNavigation.load)
    }
}

