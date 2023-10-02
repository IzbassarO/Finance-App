//
//  Finance_HopeApp.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import SwiftUI

@main
struct Finance_HopeApp: App {
    // managers
    private let paymentManager: PaymentsManager
    
    private let managersContainer: ManagersContainer
    
    init() {
        self.paymentManager = PaymentsManager()
        self.managersContainer = ManagersContainer(paymentsManager: paymentManager)
    }
    var body: some Scene {
        WindowGroup {
            TabsCoordinator(managersContainer: managersContainer)
                .view()
        }
    }
}
