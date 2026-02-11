//
//  Note.swift
//  SwiftData_ForeverNote
//
//  Created by ATEU on 2/9/26.
//

import Foundation
import SwiftData

@Model
final class Note {
    var content: String
    var updatedAt: Date
    
    init(content: String, updatedAt: Date = .now) {
        self.content = content
        self.updatedAt = updatedAt
    }
}
