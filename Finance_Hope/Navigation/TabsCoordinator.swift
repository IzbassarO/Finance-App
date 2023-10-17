//
//  TabsCoordinator.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import Foundation
import SwiftUI
import Stinsen

final class TabsCoordinator: TabCoordinatable {
    private let managersContainer: ManagersContainer

    init(managersContainer: ManagersContainer) {
        self.managersContainer = managersContainer
    }
    lazy var child = TabChild(startingItems: [
        \TabsCoordinator.home,
        \TabsCoordinator.statistics,
        \TabsCoordinator.account
    ], activeTab: 0)
    
    //routers
    @Route(tabItem: makeHomeTab) var home = makeHome
    @Route(tabItem: makeStatisticsTab) var statistics = makeStatistics
    @Route(tabItem: makeAccountTab) var account = makeAccount

    func makeHome() -> NavigationViewCoordinator<HomeCoordinator> {
        return NavigationViewCoordinator(HomeCoordinator(managerContainer: managersContainer))
    }
    
    func makeStatistics() -> NavigationViewCoordinator<StatisticsCoordinator> {
        return NavigationViewCoordinator(StatisticsCoordinator(managerContainer: managersContainer))
    }
    
    func makeAccount() -> NavigationViewCoordinator<AccountCoordinator> {
        return NavigationViewCoordinator(AccountCoordinator(managersContainer: managersContainer))
    }
    
    @ViewBuilder func makeHomeTab(isActive: Bool) -> some View {
        VStack {
            Image(systemName: "house")
            Text("title_home")
        }
    }
    
    @ViewBuilder func makeStatisticsTab(isActive: Bool) -> some View {
        VStack {
            Image(systemName: "book")
            Text("title_statistics")
        }
    }
    
    @ViewBuilder func makeAccountTab(isActive: Bool) -> some View {
        VStack {
            Image(systemName: "person.crop.circle")
            Text("title_account")
        }
    }
}
