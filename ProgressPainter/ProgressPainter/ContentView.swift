//
//  ContentView.swift
//  ProgressPainter
//
//  Created by ATEU on 2/18/26.
//

import SwiftUI
import Charts // 1. Don't forget to import this!

struct ContentView: View {
    let data = DailyIntake.last7Days
    let goalAmount: Double = 2.0 // The target line
    
    // Animation State
    @State private var animateChart = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Weekly Hydration")
                .font(.title2)
                .bold()
            
            // 2. The Chart Container
            // It takes the array of data just like a List
            Chart(data) { item in
                
                // 3. The Goal Line (RuleMark)
                // We put this first so it draws BEHIND the bars
                RuleMark(y: .value("Goal", goalAmount))
                    .foregroundStyle(.gray.opacity(0.5))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .annotation(position: .leading) {
                        Text("Goal")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                // 4. The Bars (BarMark)
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Liters", animateChart ? item.amount : 0) // Animation Trick!
                )
                // 5. Custom Coloring
                // Use a gradient or condition to make it look premium
                
                .foregroundStyle(item.amount >= goalAmount ? .blue : .red)
                .cornerRadius(5)
            }
            // 6. Chart Styling
            .frame(height: 250) // Charts need a fixed height
            // .chartYScale(domain: 0...4) // Optional: Fix the scale if needed
            .onAppear {
                // Trigger the animation when the view appears
                withAnimation(.easeInOut(duration: 0.8)) {
                    animateChart = true
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
