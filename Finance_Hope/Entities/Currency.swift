//
//  Currency.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation

/// Currency
struct Currency: Identifiable, Hashable {
    let fullName: String
    let littleName: String
    
    let id = UUID()
    
    /// Find currency by code
    static func findByCode(array: [Currency], code: String) throws -> Currency {
        if let currency = array.first(where: { currency in return currency.littleName == code }) {
            return currency
        }
        throw CurrenciesError.notFounded
    }
    
    /// Find currency by id
    static func findById(array: [Currency], id: UUID) throws -> Currency {
        if let currency = array.first(where: { currency in return currency.id == id }) {
            return currency
        }
        throw CurrenciesError.notFounded
    }
}
