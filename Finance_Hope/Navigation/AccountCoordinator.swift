//
//  AccountCoordinator.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import Foundation
import Stinsen
import SwiftUI

final class AccountCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AccountCoordinator.main)
    
    private let managersContainer: ManagersContainer
    
    private var currencyEditorViewModel: CurrencyEditorViewModel {
        return CurrencyEditorViewModel.init(managersContainer: managersContainer)
    }
    
    init(managersContainer: ManagersContainer) {
        self.managersContainer = managersContainer
    }
    
    @Root var main = makeMain
    @Route(.push) var currencyEditor = makeCurrencyEditor
    @Route(.push) var aboutApp = makeAboutApp
    @Route(.push) var developer = makeDeveloper
    
    @ViewBuilder func makeMain() -> some View {
        AccountView()
    }
    
    @ViewBuilder func makeCurrencyEditor() -> some View {
        CurrencyEditorView(viewModel: currencyEditorViewModel)
    }
    
    @ViewBuilder func makeAboutApp() -> some View {
        AboutAppView()
    }
    
    @ViewBuilder func makeDeveloper() -> some View {
        DeveloperView()
    }
}
