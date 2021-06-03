import SwiftUI

struct BookmarksViewRow: View {
    var siteName: String
    var link: String
    @Binding var isShowing: Bool
    @State var isSwiped: Bool = false
    @State var offset: CGFloat = 0.0
    @ObservedObject var viewModel: WebViewModel
    @FetchRequest(
        entity: Bookmark.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Bookmark.url, ascending: true),
        ]
    ) var bookmarkesDelete: FetchedResults<Bookmark>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(siteName)
                    .fontWeight(.medium)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(1)
                
                Text(link)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(1)
                    .opacity(0.6)
            }
            .padding(.horizontal, 5)
            Spacer()
        }
        .padding(.horizontal, 10)
        .onTapGesture {
            viewModel.url = link
            viewModel.webViewNavigationPublisher.send(.load)
            isShowing.toggle()
        }
    }
}
