//
//  ContentView.swift
//  TheSiriSidekick
//
//  Created by ATEU on 2/16/26.
//



import SwiftUI
import SwiftData
import AppIntents

struct ContentView: View {
    // 1. Fetch the list from the database, sorted by newest first
    @Query(sort: \WaterEntry.timestamp, order: .reverse) private var waterLogs: [WaterEntry]
    
    @State private var triggerHaptic = false
    
    var body: some View {
        VStack {
            Text("Hydration Station")
                .font(.largeTitle)
                .bold()
                .padding()
            
            // 2. The Big Button
            Button(intent: LogWaterIntent()) {
                Label("Log Water Now", systemImage: "drop.fill")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .simultaneousGesture(TapGesture().onEnded { triggerHaptic.toggle() })

            // 3. The List of History
            List {
                ForEach(waterLogs) { entry in
                    HStack {
                        Text("💧 Drank Water")
                        Spacer()
                        Text(entry.timestamp, format: .dateTime.hour().minute())
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .sensoryFeedback(.success, trigger: triggerHaptic)
    }
}

#Preview {
    ContentView()
}
