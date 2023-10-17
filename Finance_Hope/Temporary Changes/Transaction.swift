//
//  Transaction.swift
//  Finance_Hope
//
//  Created by Izbassar on 14.10.2023.
//
import DGCharts
import Foundation

struct Transaction {
    var year: Int
    var month: Double
    var quantity: Double
    
    static func dataEntriesForYear(_ year: Int, transactions:[Transaction]) -> [BarChartDataEntry] {
        let yearTransactions = transactions.filter{$0.year == year}
        return yearTransactions.map{BarChartDataEntry(x: $0.month, y: $0.quantity)}
    }
    
    static var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    static var allTransactions: [Transaction] {
        [
            Transaction(year: 2019, month: 0, quantity: 86),
            Transaction(year: 2019, month: 1, quantity: 15),
            Transaction(year: 2019, month: 2, quantity: 50),
            Transaction(year: 2019, month: 3, quantity: 62),
            Transaction(year: 2019, month: 4, quantity: 20),
            Transaction(year: 2019, month: 5, quantity: 19),
            Transaction(year: 2019, month: 6, quantity: 71),
            Transaction(year: 2019, month: 7, quantity: 52),
            Transaction(year: 2019, month: 8, quantity: 33),
            Transaction(year: 2019, month: 9, quantity: 75),
            Transaction(year: 2019, month: 10, quantity: 20),
            Transaction(year: 2019, month: 11, quantity: 90),
        ]
    }
}
