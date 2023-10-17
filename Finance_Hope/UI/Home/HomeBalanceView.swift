//
//  HomeBalanceView.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import SwiftUI

struct HomeBalanceView: View {
    let totalBalance: Float
    let priceType: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("\(String(format: "%.2f", totalBalance)) \(priceType)")
                        .bold()
                        .font(SwiftUI.Font.system(size: 19))
                    Spacer()
                }
                HStack {
                    Text("label_balance".localized)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            Spacer()
            Button {
                action()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
        }
    }
}
