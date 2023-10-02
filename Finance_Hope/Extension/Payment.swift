//
//  Payment.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

extension Payment {
    /// Check filter for payment
    func isFilterOk(filter: String) -> Bool {
        // is all
        if filter == "filter_all" {
            return true
        }
        
        return false
    }
    
    /// Make exportable payment
    func exportPayment() -> ExportablePayment {
        return ExportablePayment(
            date: (self.date ?? Date()).getDateTimeString(),
            about: self.about ?? "",
            price: self.price,
            name: self.name ?? ""
        )
    }
}
