//
//  LogWaterIntent.swift
//  TheSiriSidekick
//
//  Created by ATEU on 2/16/26.
//

import SwiftData
import AppIntents
import SwiftUI // Needed for some UI-related types

// 1. Conforming to 'AppIntent' tells the system this is an action Siri can perform.
struct LogWaterIntent: AppIntent {
    
    // 2. The Title and Description help the Shortcuts app categorize your action.
    // 'title' is what the user sees in the Shortcuts list.
    static var title: LocalizedStringResource = "Log Water"
    
    static var description = IntentDescription("Adds one entry to your daily water log.")

    // 3. The 'perform' function is the code that actually runs.
    // It is 'async' because it might take a moment to save data.
    @MainActor
        func perform() async throws -> some IntentResult & ReturnsValue<String> {
            
            // 1. Get access to the database
            let context = TheSiriSidekickApp.sharedModelContainer.mainContext
            
            // 2. Create a new entry
            let newEntry = WaterEntry(timestamp: Date())
            
            // 3. Save it!
            context.insert(newEntry)
            
            // (Optional) Print for debugging
            print("💧 Saved water at \(Date())")
            
            return .result(value: "Water Logged!")
        }
}
