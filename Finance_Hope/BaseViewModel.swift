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
    
    init(
        managersContainer: ManagersContainer
    ) {
        self.paymentsManager = managersContainer.getPaymentsManager()
    }
    
    /// All viewmodel publishers
    var publishers: Set<AnyCancellable> = []
    
    ///Loading data
    func loadData() { }
}
