//
//  ContentView.swift
//  InsigthEngine
//
//  Created by ATEU on 2/10/26.
//
import SwiftUI

struct ContentView: View {
    @State private var viewModel = FactViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isLoading {
                ProgressView("Fetching wisdom...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundStyle(.red)
            } else if let fact = viewModel.fact {
                Text(fact.fact)
                    .font(.title)
                    .padding()
            } else {
                Text("Ready to learn?")
            }
            
            Button("Get Fact") {
                viewModel.getNewFact()
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)
        }
    }
}

#Preview {
    ContentView()
}
