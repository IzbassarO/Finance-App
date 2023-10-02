//
//  AddPaymentView.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import SwiftUI

struct AddPaymentView: View {
    @EnvironmentObject var router: HomeCoordinator.Router
    @ObservedObject var viewModel: AddPaymentViewModel
    var body: some View {
        VStack {
            Picker("", selection: $viewModel.spendingBool) {
                Text("segment_expenses")
                    .tag(true)
                Text("segment_income")
                    .tag(false)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Form {
                Section {
                    HStack {
                        Text("field_name")
                        Spacer()
                        TextField("hint_necessarily", text: $viewModel.nameText)
                            .multilineTextAlignment(.trailing)
                            .frame(width: UIScreen.main.bounds.width / 2)
                        
                    }
                    HStack {
                        Text("field_price")
                        Spacer()
                        TextField("hint_necessarily", text: $viewModel.priceText)
                            .keyboardType(.numbersAndPunctuation)
                            .multilineTextAlignment(.trailing)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                    HStack {
                        Text("field_desc")
                        Spacer()
                        TextField("hint_necessarily", text: $viewModel.aboutText)
                            .multilineTextAlignment(.trailing)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                } footer: {
                    Text("hint_payment")
                }
            }
            .navigationTitle("title_newpayment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.tryAddPayment {
                            router.popToRoot()
//                            let generator = UINotificationFeedbackGenerator()
//                            generator.notificationOccurred(.success)
                        }                    } label: {
                        Text("btn_next")
                    }
                }
            }
        }
        .onAppear { viewModel.loadData() }
    }
}

#Preview {
    AddPaymentView(viewModel: AddPaymentViewModel.init(managersContainer: .getForPreview()))
}
