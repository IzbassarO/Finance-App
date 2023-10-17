//
//  BaseViewModel.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    //managers
    let paymentsManager: PaymentsManager
    let storageManager: StorageManager
    
    init(
        managersContainer: ManagersContainer
    ) {
        self.paymentsManager = managersContainer.getPaymentsManager()
        self.storageManager = managersContainer.getStorageManager()
    }
    
    /// All viewmodel publishers
    var publishers: Set<AnyCancellable> = []
    
    ///Loading data
    func loadData() { }
}
