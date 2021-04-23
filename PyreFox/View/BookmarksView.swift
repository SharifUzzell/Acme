//
//  BookmarksView.swift
//  PyreFox
//
//  Created by Sharif Uzzell on 4/12/21.
//

import SwiftUI

struct BookmarksView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Bookmark.entity(), sortDescriptors: [])
    var bookmarks: FetchedResults<Bookmark>
    
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
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(bookmarks) { bookmark in
                    BookmarksViewRow(siteName: bookmark.name!, link: bookmark.url!)
                }
               
            }
            .padding(.horizontal, 10)
            
            
            
            
        }
        .padding(.horizontal, 20)
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("BGColor"))
    }
    
    
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
            .preferredColorScheme(.dark)
        BookmarksView()
            .preferredColorScheme(.light)
    }
}
