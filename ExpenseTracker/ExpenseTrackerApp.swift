//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Jason Stout on 12/11/23.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: Transaction.self, migrationPlan: DatabaseMigrationPlan.self)
        } catch {
            fatalError("Failed to initialize model container")
        }
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
        .modelContainer(container)
    }
}
