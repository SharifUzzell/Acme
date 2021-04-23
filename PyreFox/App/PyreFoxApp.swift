//
//  PyreFoxApp.swift
//  PyreFox
//
//  Created by Sharif Uzzell on 4/11/21.
//

import SwiftUI

@main
struct PyreFoxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
