import SwiftUI
struct BottomNavBarView: View {
    @ObservedObject var viewModel: WebViewModel
    @State var isShowingBookmarks = false
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        HStack {
            Spacer()
            ZStack {
                HStack {
                    Button(action:{
                        print("LEFT:")
                        viewModel.webViewNavigationPublisher.send(.backward)
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.system(size:30))
                            .foregroundColor(Color.accentColor)
                            .padding(5)
                        
                    }
                    .padding(.leading, 5)
                    
                    Button(action:{
                        print("RIGHT:")
                        viewModel.webViewNavigationPublisher.send(.forward)
                    }) {
                        Image(systemName: "arrow.forward")
                            .font(.system(size:30))
                            .foregroundColor(Color.accentColor)
                            .padding(5)
                    }
                    .padding(5)
                    .padding(.vertical, 5)

                    Spacer()
                    
                    HStack{
                        Button(action:{
                            print("TAB:")
                            isShowingBookmarks.toggle()
                        }) {
                            Image(systemName: "square.fill.on.square")
                                .font(.system(size: 35))
                                .foregroundColor(Color.accentColor)
                                .padding(5)
                        }
                    }
                }
                .sheet(isPresented: $isShowingBookmarks, content: {
                    BookmarksView(isShowing: $isShowingBookmarks, viewModel: viewModel)
                        .environment(\.managedObjectContext, self.managedObjectContext)
                })

                
                Button(action:{
                    print("PLUS:")
                    let bookmark = Bookmark(context: managedObjectContext)
                    bookmark.name = viewModel.showWebTitle
                    bookmark.url = viewModel.url
                    PersistenceController.shared.saveContext()
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(Color.accentColor)
                        .padding(5)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

//
//
//struct BottomNavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        let test : ViewModel = ViewModel()
//
//        BottomNavBarView(viewModel: test).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .previewDevice("iPhone 12 Pro")
//
//        BottomNavBarView(viewModel: test).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//            .previewDevice("iPhone 12 Pro")
//    }
//}
//
//
