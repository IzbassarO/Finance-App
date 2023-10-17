//
//  ViewMonth.swift
//  Finance_Hope
//
//  Created by Izbassar on 15.10.2023.
//

import Foundation

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let price: Float

    var month: Int {
        return Calendar.current.component(.month, from: date)
    }

    var year: Int {
        return Calendar.current.component(.year, from: date)
    }
}
