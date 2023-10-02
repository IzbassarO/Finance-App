//
//  DeveloperView.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import SwiftUI

struct DeveloperView: View {
    @EnvironmentObject var router: AccountCoordinator.Router
    
    var body: some View {
        Form {
            Section {
                Button {
                    
                } label: {
                    
                }
            } header: {
                Text("Developer")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("title_devmenu")
    }
}

#Preview {
    DeveloperView()
}
