//
//  NoteViewModel.swift
//  SwiftData_ForeverNote
//
//  Created by ATEU on 2/9/26.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
final class NoteViewModel {
    var text: String = ""
    var currentNote: Note?
    
    // 1. Keep track of the pending save operation
    private var saveTask: Task<Void, Never>?
    
    func loadNote(context: ModelContext) {
        let descriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.updatedAt, order: .reverse)])
        do {
            let notes = try context.fetch(descriptor)
            if let existingNote = notes.first {
                self.currentNote = existingNote
                self.text = existingNote.content
            }
        } catch {
            print("Failed to fetch note: \(error)")
        }
    }
    
    /// Auto-save logic
    func debouncedSave(context: ModelContext) {
        // 2. Stop any previous save that hasn't finished yet
        saveTask?.cancel()
        
        // 3. Start a new "waiting" task
        saveTask = Task {
            // Wait for 1 second (1_000_000_000 nanoseconds)
            // If the user types again during this sleep, this task gets cancelled
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            // 4. If we are still here (not cancelled), save the data
            if !Task.isCancelled {
                await performSave(context: context)
            }
        }
    }
    
    // Helper function to do the actual database writing
    @MainActor
    private func performSave(context: ModelContext) {
        if let note = currentNote {
            // Update
            note.content = text
            note.updatedAt = .now
            print("Updated Note: \(text)") // Debug print to verify it works
        } else {
            // Insert
            let newNote = Note(content: text)
            context.insert(newNote)
            currentNote = newNote
            print("Created New Note: \(text)")
        }
        
        try? context.save()
    }
}
