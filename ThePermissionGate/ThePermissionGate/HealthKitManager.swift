//
//  HealthKitManager.swift
//  ThePermissionGate
//
//  Created by ATEU on 2/18/26.
//

import Foundation
import HealthKit

@Observable // Makes the UI update automatically when status changes
class HealthKitManager {
    
    // 1. The Singleton Instance
    // This ensures there is only ONE manager for the entire app.
    static let shared = HealthKitManager()
    
    // 2. The Store
    // This is the "Database Connection" to the Health App.
    let healthStore = HKHealthStore()
    
    // 3. Status Tracker
    // We use this to disable the button if HealthKit isn't available (e.g., on iPad)
    var isHealthKitAvailable: Bool = false
    
    private init() {
        // 4. Check Availability immediately
        // iPad doesn't have HealthKit (historically), so we must check.
        isHealthKitAvailable = HKHealthStore.isHealthDataAvailable()
    }
    
    // 5. The Request Function
    func requestPermission() async {
        // Guard check: Don't try if the device doesn't support it.
        guard isHealthKitAvailable else { return }
        
        // A. Define what we want to READ
        // We want specifically "Step Count".
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        
        let dataTypesToRead: Set<HKObjectType> = [stepCountType]
        
        // B. Request Authorization
        // We pass 'nil' to share (writing) because we only want to READ right now.
        do {
            try await healthStore.requestAuthorization(toShare: [], read: dataTypesToRead)
            print("✅ Request sent! (Check the popup)")
        } catch {
            print("❌ Error requesting permission: \(error.localizedDescription)")
        }
    }
}
