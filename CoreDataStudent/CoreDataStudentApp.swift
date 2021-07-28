//
//  CoreDataStudentApp.swift
//  CoreDataStudent
//
//  Created by Olivier Van hamme on 28/07/2021.
//

import SwiftUI

@main
struct CoreDataStudentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
