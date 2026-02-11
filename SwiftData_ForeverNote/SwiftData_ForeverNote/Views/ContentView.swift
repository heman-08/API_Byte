//
//  ContentView.swift
//  SwiftData_ForeverNote
//
//  Created by ATEU on 2/9/26.
//
import SwiftUI
import SwiftData

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = NoteViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $viewModel.text)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding()
                    // 1. This triggers EVERY time you type a character
                    .onChange(of: viewModel.text) {
                        viewModel.debouncedSave(context: modelContext)
                    }
                
                // 2. We removed the "Save" button!
                
                Text("Status: Auto-saving...")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("The Forever Note")
            .onAppear {
                viewModel.loadNote(context: modelContext)
            }
        }
    }
}

#Preview{
    ContentView()
    // This injects the ModelContext into ContentView and its children
    .modelContainer(for: Note.self)
}
