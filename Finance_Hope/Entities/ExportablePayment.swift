//
//  ExportablePayment.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

struct ExportablePayment: Identifiable {
    var id = UUID().uuidString
    var date: String
    var about: String
    var price: Float
    var name: String
}
