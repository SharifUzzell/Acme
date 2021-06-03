import SwiftUI

struct BookmarksView: View {
    @Binding var isShowing: Bool
    @ObservedObject var viewModel: WebViewModel
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Bookmark.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Bookmark.name, ascending: true)
        ]
    ) var bookmarks: FetchedResults<Bookmark>

    var body: some View {
        
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Image(systemName: "chevron.compact.down")
                    .font(.system(size:30))
                    .padding(.top, 7)
                    .padding(.bottom, 2)
                    .opacity(0.4)
            }
            .frame(maxWidth: .infinity)
            
            Text("Bookmarks")
                .fontWeight(.heavy)
                .font(.title)
                .foregroundColor(Color.accentColor)
            
            Divider()
            List {
                ForEach(bookmarks) { bookmark in
                    HStack {
                        BookmarksViewRow(siteName: bookmark.name!, link: bookmark.url!, isShowing: $isShowing, viewModel: viewModel)
                    }
                }
                .onDelete(perform: removeBookmarks)

            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 20)
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("BGColor"))
    }
    
    func removeBookmarks(at offsets: IndexSet) {
        for index in offsets {
            let bookmarks = bookmarks[index]
            managedObjectContext.delete(bookmarks)
        }
    }
}
