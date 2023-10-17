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
                Text("segment_expenses".localized)
                    .tag(true)
                Text("segment_income".localized)
                    .tag(false)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Form {
                Section {
                    HStack {
                        Text("field_name".localized)
                        Spacer()
                        TextField("hint_necessarily".localized, text: $viewModel.nameText)
                            .multilineTextAlignment(.trailing)
                            .frame(width: UIScreen.main.bounds.width / 2)
                        
                    }
                    HStack {
                        Text("field_price".localized)
                        Spacer()
                        TextField("hint_necessarily".localized, text: $viewModel.priceText)
                            .keyboardType(.numbersAndPunctuation)
                            .multilineTextAlignment(.trailing)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                    HStack {
                        Text("field_desc".localized)
                        Spacer()
                        TextField("hint_necessarily".localized, text: $viewModel.aboutText)
                            .multilineTextAlignment(.trailing)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                } footer: {
                    Text("hint_payment".localized)
                }
            }
            .navigationTitle("title_newpayment".localized)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.tryAddPayment {
                            router.popToRoot()
                        }                    } label: {
                        Text("btn_next".localized)
                    }
                }
            }
        }
        .toast(message: viewModel.errorText, isShowing: $viewModel.isError, config: .init(isError: true))
        .onAppear { viewModel.loadData() }
    }
}

#Preview {
    AddPaymentView(viewModel: AddPaymentViewModel.init(managersContainer: .getForPreview()))
}
