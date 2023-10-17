//
//  ContentView2.swift
//  Finance_Hope
//
//  Created by Izbassar on 14.10.2023.
//

import Foundation
import SwiftUI
import DGCharts

struct ContentView2: View {
    @State private var selectedYear: Int = 2019
    @State private var barEntries: [BarChartDataEntry] = []
    @State private var selectedItem = ""
    
    var body: some View {
        VStack {
            Text("\(selectedYear)".replacingOccurrences(of: ",", with: ""))
                .font(.title2)
            Button("Change Year") {
                if selectedYear == 2019 {
                    selectedYear = 2019
                } else {
                    selectedYear = 2019
                }
            }
            TransactionBarChartView(entries: Transaction.dataEntriesForYear(selectedYear, transactions: Transaction.allTransactions), selectedYear: $selectedYear, selectedItem: $selectedItem
            )
            .frame(height: 500)
            Text(selectedItem)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
