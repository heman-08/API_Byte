//
//  NeetworkService.swift
//  InsigthEngine
//
//  Created by ATEU on 2/10/26.
//

import Foundation

struct NetworkService {
    func fetchFact() async throws -> Fact {
        guard let url = URL(string: "https://catfact.ninja/fact") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Fact.self, from: data)
    }
}
