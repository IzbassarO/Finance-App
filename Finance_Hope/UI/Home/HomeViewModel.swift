//
//  HomeViewModel.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    @Published private(set) var balance: Balance
    @Published private(set) var priceType: String = "USD"
    @Published private(set) var payments: [Payment] = []
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var selectedFilter: String = Filter.all.rawValue
    override init(managersContainer: ManagersContainer) {
        self.balance = Balance(current: 0, income: 0, outcome: 0)
        super.init(managersContainer: managersContainer)
    }
    
    override func loadData() {
        PaymentsPublisher(paymentsManager: paymentsManager)
            .sink { payments in
                self.payments = payments
                BalancePublisher(payments: payments)
                    .sink { balance in
                        self.balance = balance
                        self.isLoading = false
                    }
                    .store(in: &self.publishers)
            }
            .store(in: &publishers)
        
//        self.priceType = self.storageManager.getPriceType()
    }
    
    /// Delete payment by index
    func deletePayment(index: Int) {
        self.paymentsManager.removePayment(index: index)
        self.payments.remove(at: index)
        self.isLoading = true
        BalancePublisher(payments: self.payments)
            .sink { balance in
                self.balance = balance
                self.isLoading = false
            }
            .store(in: &self.publishers)
    }
    
    /// Add new payment
    func addPayment(price: Float, about: String, name: String) {
        let payment = self.paymentsManager.addPayment(price: price, about: about, name: name)
        self.payments.insert(payment, at: 0)
        self.isLoading = true
        BalancePublisher(payments: self.payments)
            .sink { balance in
                self.balance = balance
                self.isLoading = false
            }
            .store(in: &self.publishers)
    }
}
