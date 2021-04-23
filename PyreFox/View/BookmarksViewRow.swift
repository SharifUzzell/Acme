//
//  BookmarksViewRow.swift
//  PyreFox
//
//  Created by Sharif Uzzell on 4/12/21.
//

import SwiftUI

struct BookmarksViewRow: View {
    var siteName: String
    var link: String
    @State var isSwiped: Bool = false
    @State var offset: CGFloat = 0.0
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Bookmark.entity(), sortDescriptors: [])
    var bookmarks: FetchedResults<Bookmark>
    
    var body: some View {
        ZStack {
            HStack{
                Button(action: {
                   deleteItems(url: link)
                }){
                    Spacer()
                    Image(systemName: "trash")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                
            }
            .background(Color.red)
            
            HStack{
                Spacer()
            }
            .frame(height:37)
            .background(Color("BGColor"))
            .offset(x: offset)
            .gesture(DragGesture()
                        .onChanged(swiped(value:))
                        .onEnded(end(value:))
            )
            
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
            
            
            
        }
        .overlay(Rectangle().frame(width: nil, height: 0.2, alignment: .top).foregroundColor(Color.gray.opacity(0.5)), alignment: .bottom)
        
        
        //A row that looks similar to google chrome mobiles bookmarks
        //Website title, below it the exact link name
        //Preview icon next to it
    }
    
    func swiped(value: DragGesture.Value){
        withAnimation(.easeInOut(duration: 0.2)){
            if value.translation.width < 0{
                offset = -70
                isSwiped = true
            }else{
                offset = 0
            }
        }
        
        
    }
    
    func end(value: DragGesture.Value){
        withAnimation(.easeInOut(duration: 0.3)){
            if isSwiped{
                offset += 10
                isSwiped = false
            }
            
        }
    }
    
    func deleteItems(url: String) {
        let fetchRequest = FetchRequest<Bookmark>(entity: Bookmark.entity(), sortDescriptors: [], predicate: NSPredicate(format: "url == %@", url))
        var urls: FetchedResults<Bookmark>{ fetchRequest.wrappedValue}
        for bookmark in urls {
            viewContext.delete(bookmark)
        }
        
        do {
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}



struct BookmarksViewRow_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksViewRow(siteName: "Google", link: "www.google.com")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        
        BookmarksViewRow(siteName: "Google", link: "www.google.com")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
