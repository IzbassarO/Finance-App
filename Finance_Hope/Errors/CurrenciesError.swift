//
//  CurrenciesError.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation

enum CurrenciesError: LocalizedError {
    case notFounded
    
    var errorDescription: String? {
        switch self {
        case .notFounded:
            return "currencieserror_notfounded"
        }
    }
}
