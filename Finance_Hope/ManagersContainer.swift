//
//  ManagersContainer.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation

final class ManagersContainer {
    private let paymentsManager: PaymentsManager
    
    init(
        paymentsManager: PaymentsManager
    ) {
        self.paymentsManager = paymentsManager
    }
    func getPaymentsManager() -> PaymentsManager {
        return paymentsManager
    }
    
    static func getForPreview() -> ManagersContainer {
        return ManagersContainer(
            paymentsManager: PaymentsManager()
        )
    }
}
