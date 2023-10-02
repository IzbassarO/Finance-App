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
    
    @Root var main = makeMain
    @Route(.push) var currencyEditor = makeCurrencyEditor
    @Route(.push) var aboutApp = makeAboutApp
    @Route(.push) var developer = makeDeveloper
    
    @ViewBuilder func makeMain() -> some View {
        AccountView()
    }
    
    @ViewBuilder func makeCurrencyEditor() -> some View {
        CurrencyEditorView()
    }
    
    @ViewBuilder func makeAboutApp() -> some View {
        AboutAppView()
    }
    
    @ViewBuilder func makeDeveloper() -> some View {
        DeveloperView()
    }
}
