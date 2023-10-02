//
//  Date.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

extension Date {
    /// Get date string
    func getDateString() -> String {
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    /// Get date+time string
    func getDateTimeString() -> String {
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm:ss"
        return dateFormatter.string(from: date)
    }
}
