//
//  StatisticsViewModel.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import Foundation
import Combine

class StatisticsViewModel: BaseViewModel {
    @Published private(set) var priceType: String = "USD"
    @Published private(set) var payments: [Payment] = []
    @Published private(set) var exportablePayments: [ExportablePayment] = []
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var viewMonths: [ViewMonth] = []
    
    override init(managersContainer: ManagersContainer) {
        super.init(managersContainer: managersContainer)
        // Fetch payments from paymentsManager
        payments = paymentsManager.getPayments()
        
        // Create exportable payments and site view while formatting date
        for payment in payments {
            // Format the date here and create ViewMonth
            let viewMonth = ViewMonth(
                date: payment.date!,
                price: payment.price
            )
            
            viewMonths.append(viewMonth)
        }
        
        self.isLoading = false
    }
    
    override func loadData() {
        self.priceType = self.storageManager.getPriceType()
    }
}
