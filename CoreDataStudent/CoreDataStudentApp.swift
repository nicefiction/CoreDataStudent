// CoreDataStudentApp.swift

/// Setting up Core Data requires two steps :
/// 1. Creating what is called a `persistent container` ,
/// which is what loads and saves the actual data from device storage ,
/// and 2. Injecting that into the SwiftUI `environment`
/// so that all our views can access it .

import SwiftUI



@main
struct CoreDataStudentApp: App {
   
   // MARK: - PROPERTIES
   
   let persistenceController = PersistenceController.shared
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some Scene {
      
      WindowGroup {
         ContentView()
            .environment(\.managedObjectContext,
                         persistenceController.container.viewContext)
      }
   }
}
