//
//  WaterEntry.swift
//  TheSiriSidekick
//
//  Created by ATEU on 2/17/26.
//

import Foundation
import SwiftData

@Model
final class WaterEntry {
    var timestamp: Date
    
    init(timestamp: Date = Date()) {
        self.timestamp = timestamp
    }
}
