//
//  BookmarkCheck.swift
//  PyreFox
//
//  Created by Sharif Uzzell on 4/15/21.
//

import SwiftUI
import CoreData

struct BookmarkCheck: View {
    var fetchRequest: FetchRequest<Bookmark>
    var urls: FetchedResults<Bookmark>{ fetchRequest.wrappedValue}
    
    init(filter: String) {
        fetchRequest = FetchRequest<Bookmark>(entity: Bookmark.entity(), sortDescriptors: [], predicate: NSPredicate(format: "url == %@", filter))
    }
    
    var body: some View {
        if(urls.isEmpty){
            Image("star")
        }else{
            Image("star.fill")
        }
    }
}

