import SwiftUI
import CoreData


class TabList: ObservableObject {
    @Published var tabs: [BrowserPage] = [BrowserPage()]
    
    func newTab(){
        tabs.append(BrowserPage())
    }
    
}
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var tablist: TabList = TabList()
    
    @State var selection = 0
    @State var showTabs: Bool = false

    var body: some View {
        VStack {
          
            tablist.tabs[selection]
            Button("next") {
                withAnimation {
                    selection = (selection + 1) % tablist.tabs.count
                }
            }
            Divider()
            Button("add") {
                withAnimation {
                    tablist.newTab()
                    selection = tablist.tabs.count - 1
                    
                }
            }
            Divider()
            Text("\(selection)")
            Text("\(tablist.tabs.count)")
            
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .sheet(isPresented: $showTabs, content: {
            
        })
        
        
    }
    
    
}



//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext, )
//            .previewDevice("iPhone 12 Pro")
//
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//            .previewDevice("iPhone 12 Pro")
//    }
//}
