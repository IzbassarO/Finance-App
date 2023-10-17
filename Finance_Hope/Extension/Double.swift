//
//  Double.swift
//  Finance_Hope
//
//  Created by Izbassar on 14.10.2023.
//

import Foundation

extension Float {
    var stringFormat: String {
        if self >= 10000 && self < 999999{
            return String(format: "%.1fK", self / 1000).replacingOccurrences(of: ".0", with: "")
        }
        if self > 999999 {
            return String(format: "%.1fM", self / 1000000).replacingOccurrences(of: ".0", with: "")
        }
        
        return String(format: "%.0f", self)
    }
}
