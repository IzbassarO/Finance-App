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
    
    func monthValue() -> Int {
        return Calendar.current.component(.month, from: self)
    }
    
    func yearValue() -> Int {
        return Calendar.current.component(.year, from: self)
    }
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
