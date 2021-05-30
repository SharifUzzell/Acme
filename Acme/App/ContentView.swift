import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        BrowserPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")

        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewDevice("iPhone 12 Pro")
    }
}
