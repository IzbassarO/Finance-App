//
//  Validator.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation

/// Base protocol for validators
protocol Validator {
    static func validate(str: String) -> Bool
}
