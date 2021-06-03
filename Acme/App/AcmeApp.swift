import SwiftUI

@main
struct AcmeApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.saveContext()
        }
    }
}
