
import SwiftUI
struct TabInfoStruct: Identifiable {
    var id: UUID
    var url: String
    var title: String
    var isBookmarked: Bool
    var isReloading: Bool
    var goBack: Bool
    var goForward: Bool
    init() {
        id = UUID.init()
        url = ""
        title = "Neeva"
        isBookmarked = false
        isReloading = false
        goBack =  false
        goForward =  false
    }
}

class TabInfo: ObservableObject {
    @Published var info: TabInfoStruct = TabInfoStruct()
}

struct BrowserPage: View {
    @ObservedObject var observableInfo = TabInfo()
    var body: some View {
        VStack{
            URLBarView(urlString: $observableInfo.info.url, urlTitle: $observableInfo.info.title, isBookmarked: $observableInfo.info.isBookmarked, isReloading: $observableInfo.info.isReloading)
            
            HStack{
                websiteView(Title: $observableInfo.info.title, urlString: $observableInfo.info.url, isReloading: $observableInfo.info.isReloading, goBack: $observableInfo.info.goBack, goForward: $observableInfo.info.goForward)
            }
            HStack {
                BottomNavBarView(goBack: $observableInfo.info.goBack, goForward: $observableInfo.info.goForward)
            }
            .padding(.bottom, 18)
            Spacer()
        }
        
    }
}

struct BrowserPage_Previews: PreviewProvider {
    static var previews: some View {
        BrowserPage()
        
        
        BrowserPage()
            .preferredColorScheme(.dark)
    }
}
