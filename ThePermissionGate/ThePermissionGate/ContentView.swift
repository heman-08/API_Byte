//
//  ContentView.swift
//  ThePermissionGate
//
//  Created by ATEU on 2/18/26.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    // Inject our Singleton Manager
    var healthManager = HealthKitManager.shared
    
    @State private var hasRequested = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 1. The Status Icon
            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 80))
                .foregroundStyle(.pink)
            
            Text("Health Access")
                .font(.largeTitle)
                .bold()
            
            Text("To give you personalized insights, we need access to your step count.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding()
            
            // 2. The Gate Button
            Button {
                Task {
                    await healthManager.requestPermission()
                    hasRequested = true
                }
            } label: {
                Text("Connect Health")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .disabled(!healthManager.isHealthKitAvailable) // Disable on iPad
            
            if hasRequested {
                Text("Check the system popup!")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
