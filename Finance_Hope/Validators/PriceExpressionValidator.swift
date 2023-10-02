//
//  PriceExpressionValidator.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation

/// Price string validator
class PriceExpressionValidator: Validator {
    static func validate(str: String) -> Bool {
        if str.isEmpty {
            return false
        }
        
        var isValid = true
        let allowed = "01234567890.+-"
        str.forEach { char in
            if !allowed.contains(char) {
                isValid = false
            }
        }
        return isValid
    }
}
