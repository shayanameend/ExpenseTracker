import SwiftUI
import SwiftData

@main
struct ciao_swiftApp: App {
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([Expense.self])
    
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    
    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(sharedModelContainer)
  }
}
