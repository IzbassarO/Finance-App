//
//  HomeCoordinator.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import Foundation
import Stinsen
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    private let managersContainer: ManagersContainer
    
    // viewModels
    private let homeViewModel: HomeViewModel
    private let addPaymentViewModel: AddPaymentViewModel
    private let welcomeViewModel: WelcomeViewModel

    let stack = NavigationStack(initial: \HomeCoordinator.main)
    
    @Root var main = makeStart
    @Root(.push) var pushToPayment = makeAddPayment
    @Route(.modal) var welcome = makeWelcome

    init(managerContainer: ManagersContainer) {
        self.managersContainer = managerContainer
        
        //view models
        homeViewModel = .init(managersContainer: managerContainer)
        addPaymentViewModel = .init(managersContainer: managerContainer)
        welcomeViewModel = .init(managersContainer: managersContainer)
    }
    
    @ViewBuilder func makeStart() -> some View {
        HomeView(viewModel: homeViewModel)
    }
    
    @ViewBuilder func makeAddPayment() -> some View {
        AddPaymentView(viewModel: addPaymentViewModel)
    }
    
    @ViewBuilder func makeWelcome() -> some View {
        WelcomeView(viewModel: welcomeViewModel)
    }
}
