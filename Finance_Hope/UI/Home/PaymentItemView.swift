//
//  PaymentItemView.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import SwiftUI

struct PaymentItemView: View {
    var payment: Payment
    var priceType: String
    var body: some View {
        HStack {

            VStack {
                Text(payment.name ?? "No name")
                    .bold()
                    .font(.system(size: 16))
                if payment.about != nil {
                    Spacer()
                    Text((payment.about == nil) ? "..." : payment.about ?? "")
                        .font(.caption)
                        .font(.system(size: 14))
                        .opacity(0.5)
                }
            }
            .padding(.leading, 1)
            
            Spacer()
            
            VStack {
                Text("\((payment.date ?? Date()).getDateString())")
                    .font(.system(size: 14))
                    .opacity(0.5)
                Spacer()
                Text("\(String(format: "%.2f", payment.price)) \(priceType)")
                    .bold()
                    .font(.system(size: 16))
            }
        }
        .frame(height: 40)
    }
}
