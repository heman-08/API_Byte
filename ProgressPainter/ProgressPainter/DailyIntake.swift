//
//  DailyIntake.swift
//  ProgressPainter
//
//  Created by ATEU on 2/18/26.
//

import Foundation

struct DailyIntake: Identifiable {
    let id = UUID()
    let day: String      // X-Axis (e.g., "Mon", "Tue")
    let amount: Double   // Y-Axis (e.g., 2.5 Liters)
}

// Let's create some mock data to test with
extension DailyIntake {
    static let last7Days: [DailyIntake] = [
        .init(day: "Mon", amount: 1.5),
        .init(day: "Tue", amount: 2.8),
        .init(day: "Wed", amount: 0.9), // A bad day
        .init(day: "Thu", amount: 3.1), // A great day
        .init(day: "Fri", amount: 2.0),
        .init(day: "Sat", amount: 1.8),
        .init(day: "Sun", amount: 5.5)
    ]
}
