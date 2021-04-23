//
//  Bookmark+CoreDataProperties.swift
//  PyreFox
//
//  Created by Sharif Uzzell on 4/15/21.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var url: String?
    @NSManaged public var name: String?
    
    var wrappedurl: String {
        url ?? "Unknown"
    }
    var wrappedname: String {
        name ?? "Unknown"
    }
}

extension Bookmark : Identifiable {

}
