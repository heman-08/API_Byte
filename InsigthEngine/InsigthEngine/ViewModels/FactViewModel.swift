//
//  FactViewModel.swift
//  InsigthEngine
//
//  Created by ATEU on 2/10/26.
//

import Foundation
import SwiftUI // Needed for @MainActor

@MainActor
@Observable
class FactViewModel {
    var fact: Fact?
    var isLoading = false
    var errorMessage: String?
    
    private let service = NetworkService()
    
    func getNewFact() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                self.fact = try await service.fetchFact()
            } catch {
                self.errorMessage = error.localizedDescription
            }
            self.isLoading = false
        }
    }
}
