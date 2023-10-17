//
//  AccountView.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var router: AccountCoordinator.Router
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                Form {
                    Image("Account")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                        .overlay(
                            Circle()
                                .stroke(.blue, lineWidth: 1.0)
                        )
                    
                    Section {
                        HStack {
                            Text("Name")
                            Spacer()
                        }
                        HStack {
                            Text("Surname")
                            Spacer()
                            Text("")
                        }
                    } header: {
                        Text("details_account".localized).textCase(.none)
                    }
                    
                    Section {
                        Text("label_currency".localized)
                    } header: {
                        Text("title_currency".localized)
                    }
                    .onTapGesture {
                        router.route(to: \.currencyEditor)
                    }
                }
            }
        }
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AccountView()
}
