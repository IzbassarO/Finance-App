//
//  HomeView.swift
//  Finance_Hope
//
//  Created by Izbassar on 01.10.2023.
//

import SwiftUI

// MARK: fixme
var isFirstHomeOpen = true

struct HomeView: View {
    //objects
    @EnvironmentObject var router: HomeCoordinator.Router
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    Section {
                        HomeBalanceView(
                            totalBalance: viewModel.balance.current,
                            priceType: viewModel.priceType) {
                                router.route(to: \.pushToPayment)
                            }
                    } header: {
                        Text("label_home".localized)
                    }
                    
                    Section {
                        if viewModel.payments.count > 0 {
                            ForEach(viewModel.payments, id: \.self) { payment in
                                if payment.isFilterOk(filter: viewModel.selectedFilter) {
                                    PaymentItemView(
                                        payment: payment,
                                        priceType: viewModel.priceType
                                    )
                                }
                            }
                            .onDelete{ indexSet in
                                if let index = indexSet.first {
                                    viewModel.deletePayment(index: index)
                                }
                            }
                        } else {
                            //empty
                            Text("label_nopayments".localized)
                        }
                    } header: {
                        Text("label_payments".localized)
                    }
                    .onAppear {
                        if isFirstHomeOpen {
                            router.route(to: \.welcome)
                            isFirstHomeOpen = false
                        }
                    }
                }
            }
        }
        .navigationTitle("title_home".localized)
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel.init(managersContainer: .getForPreview()))
}
