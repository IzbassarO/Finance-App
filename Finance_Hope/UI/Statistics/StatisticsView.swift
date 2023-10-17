////
////  StatisticsView.swift
////  Finance_Hope
////
////  Created by Izbassar on 01.10.2023.
////

import Foundation
import SwiftUI
import Charts

struct StatisticsView: View {
    @State var currentTab: String = "7 Days"
    @State var plotWidth: CGFloat = 0
    @State var isLineGraph: Bool = false
    @ObservedObject var viewModel: StatisticsViewModel
    
    private let months: [Int: Date] = [
        1: Date.from(year: 2023, month: 1, day: 1),
        2: Date.from(year: 2023, month: 2, day: 1),
        3: Date.from(year: 2023, month: 3, day: 1),
        4: Date.from(year: 2023, month: 4, day: 1),
        5: Date.from(year: 2023, month: 5, day: 1),
        6: Date.from(year: 2023, month: 6, day: 1),
        7: Date.from(year: 2023, month: 7, day: 1),
        8: Date.from(year: 2023, month: 8, day: 1),
        9: Date.from(year: 2023, month: 9, day: 1),
        10: Date.from(year: 2023, month: 10, day: 1),
        11: Date.from(year: 2023, month: 11, day: 1),
        12: Date.from(year: 2023, month: 12, day: 1)
    ]
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Total")
                                .fontWeight(.semibold)
                            
                            Picker("", selection: $currentTab) {
                                Text("7 Days")
                                    .tag("7 Days")
                                Text("Week")
                                    .tag("Week")
                                Text("Month")
                                    .tag("Month")
                            }
                            .pickerStyle(.segmented)
                            .padding(.leading, 80)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.white.shadow(.drop(radius: 2)))
                        }
                        
                        Toggle("Line Graph", isOn: $isLineGraph)
                        
                        Chart {
                            ForEach(viewModel.viewMonths) { viewMonth in
                                if isLineGraph {
                                    LineMark(
                                        x: .value("Month", months[viewMonth.date.monthValue()] ?? Date(), unit: .month),
                                        y: .value("Views", viewMonth.price))
                                } else {
                                    BarMark(
                                        x: .value("Month", months[viewMonth.date.monthValue()] ?? Date(), unit: .month),  // Use viewMonth.month instead of viewMonth.date
                                        y: .value("Views", viewMonth.price))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                    .navigationTitle("Statistics")
                    .onChange(of: currentTab) { newValue in
                        
                    }
                }
            }
        }
    }
    
    func updateData() {
        
    }
}
