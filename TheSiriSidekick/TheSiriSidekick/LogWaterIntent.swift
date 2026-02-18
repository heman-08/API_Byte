//
//  LogWaterIntent.swift
//  TheSiriSidekick
//
//  Created by ATEU on 2/16/26.
//

import AppIntents
import SwiftData

struct LogWaterIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Log Water"
    static var description = IntentDescription("Adds one entry to your daily water log.")

    // 1. TELL SIRI: "Don't open the app, just do it in the background."
    static var openAppWhenRun: Bool = false

    // 2. TELL SIRI: "You don't need FaceID to run this."
    // This allows it to work while the phone is in your pocket or locked.
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> {
        // ... (Your existing code stays here) ...
        
        let context = TheSiriSidekickApp.sharedModelContainer.mainContext
        let newEntry = WaterEntry(timestamp: Date())
        context.insert(newEntry)
        
        return .result(value: "Water Logged!")
    }
}
