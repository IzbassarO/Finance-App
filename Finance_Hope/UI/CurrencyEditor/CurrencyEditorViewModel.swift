//
//  CurrencyEditorViewModel.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation
import SwiftUI
import Combine

class CurrencyEditorViewModel {
    @Published private(set) var selectedCurrencyId: UUID = Currencies.currenciesPopular.first!.id
    @Published private(set) var isLoading: Bool = true
    
    ///Load data
    func loadData() {
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    ///Set currency
    func setCurrency(id: UUID) {
        selectedCurrencyId = id
        do {
            let currency = try Currency.findById(array: Currencies.currenciesAll, id: selectedCurrencyId)
        } catch let err {
            print("Failed to set currency. \(err)")
        }
    }
}
