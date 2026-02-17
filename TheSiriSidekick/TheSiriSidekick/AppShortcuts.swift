//
//  AppShortcuts.swift
//  TheSiriSidekick
//
//  Created by ATEU on 2/16/26.
//

import AppIntents

struct AppShortcuts: AppShortcutsProvider {
    
    // This color is used for the shortcut banner in the Shortcuts app
    static var shortcutTileColor: ShortcutTileColor = .blue
    
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: LogWaterIntent(),
            phrases: [
                "Log a drink in \(.applicationName)",
                "Track water in \(.applicationName)",
                "Add water in \(.applicationName)"
            ],
            shortTitle: "Log Water",
            systemImageName: "drop.fill"
        )
    }
}
