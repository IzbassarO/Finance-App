//
//  StatisticsCoordinator.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import Foundation
import Stinsen
import SwiftUI

final class StatisticsCoordinator: NavigationCoordinatable {
    private let managersContainer: ManagersContainer
    
    let stack = NavigationStack(initial: \StatisticsCoordinator.main)
    
    @Root var main = makeMain

    private let statisticsViewModel: StatisticsViewModel
    
    init(managerContainer: ManagersContainer) {
        self.managersContainer = managerContainer
        
        //view models
        statisticsViewModel = .init(managersContainer: managerContainer)
    }
    
    @ViewBuilder func makeMain() -> some View {
        StatisticsView(viewModel: statisticsViewModel)
    }
}
