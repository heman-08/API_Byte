//
//  SwiftData_ForeverNoteApp.swift
//  SwiftData_ForeverNote
//
//  Created by ATEU on 2/9/26.
//

import SwiftUI
import SwiftData

@main
struct ForeverNoteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // This injects the ModelContext into ContentView and its children
        .modelContainer(for: Note.self)
    }
}
