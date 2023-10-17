//
//  ManagersContainer.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation

final class ManagersContainer {
    private let paymentsManager: PaymentsManager
    private let storageManager: StorageManager
    
    init(
        paymentsManager: PaymentsManager,
        storageManager: StorageManager
    ) {
        self.paymentsManager = paymentsManager
        self.storageManager = storageManager
    }
    
    func getPaymentsManager() -> PaymentsManager {
        return paymentsManager
    }
    
    func getStorageManager() -> StorageManager {
        return storageManager
    }
    
    static func getForPreview() -> ManagersContainer {
        return ManagersContainer(
            paymentsManager: PaymentsManager(),
            storageManager: StorageManager()
        )
    }
}
