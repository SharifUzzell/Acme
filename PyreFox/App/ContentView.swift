import SwiftUI
import CoreData

struct Tab: Identifiable {
    var id: UUID = UUID()
    var browserTab: BrowserPage = BrowserPage()
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @State var isShowingBookmarks: Bool = false
    var tabs: [Tab] = [Tab()]
    var body: some View {
        VStack {
            TabView {
                ForEach(tabs){ tab in
                    tab.browserTab
                        .tabItem { Image(systemName: "heart") }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .onAppear() {
                UITabBar.appearance().barTintColor = .systemBackground
            }
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//        .sheet(isPresented: $isShowingBookmarks, content: {
//            BookmarksView()
//        })
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice("iPhone 12 Pro")
        
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewDevice("iPhone 12 Pro")
    }
}
