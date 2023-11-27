import SwiftUI
import SwiftData

@main
struct NookHelperApp: App {
    var sharedModelContainer: ModelContainer = {
        do {
            return try ModelContainer(for: UserData.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            OpeningView()
        }
        .modelContainer(sharedModelContainer)
    }
}
