//
//  TheSiriSidekickApp.swift
//  TheSiriSidekick
//
//  Created by ATEU on 2/16/26.
//

import SwiftUI
import SwiftData

@main
struct TheSiriSidekickApp: App {
    // 1. Create a static container so the Intent can find it too
    static var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            WaterEntry.self,
        ])
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
        // 2. Inject it into the app view
        .modelContainer(TheSiriSidekickApp.sharedModelContainer)
    }
}
