//
//  CurrencyEditorView.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import SwiftUI

struct CurrencyEditorView: View {
    @EnvironmentObject var router: AccountCoordinator.Router
    @ObservedObject var viewModel: CurrencyEditorViewModel
    
    @State private var filterText: String = ""

    var body: some View {
        VStack {
            SearchBarView(text: $filterText, hint: "hint_search".localized)
                .onChange(of: filterText) { _ in
                    viewModel.updateFilter(filterString: filterText)
                }
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    // popular
                    if filterText == "" {
                        Section {
                            ForEach(Currencies.currenciesPopular, id: \.self) { curr in
                                if curr.fullName.lowercased().contains(filterText.lowercased()) || curr.littleName.lowercased().contains(filterText.lowercased()) || filterText.isEmpty {
                                    Button {
                                        viewModel.setCurrency(id: curr.id)
                                    } label: {
                                        HStack {
                                            Text(curr.fullName)
                                                .foregroundColor(Color("DefaultText"))
                                            Text(curr.littleName)
                                                .foregroundColor(.gray)
                                            Spacer()
                                            if viewModel.selectedCurrencyId == curr.id {
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(.blue)
                                                    .transition(.opacity)
                                            }
                                        }
                                    }
                                }
                            }
                        } header: {
                            Text("label_popular".localized)
                        }
                    }
                    
                    if viewModel.currenciesFiltered.isEmpty {
                        Text("search_empty".localized)
                    } else {
                        // all
                        Section {
                            ForEach(viewModel.currenciesFiltered, id: \.self) { curr in
                                Button(action: {
                                    viewModel.setCurrency(id: curr.id)
                                }, label: {
                                    HStack {
                                        Text(curr.fullName)
                                            .foregroundColor(Color("DefaultText"))
                                        Text(curr.littleName)
                                            .foregroundColor(.gray)
                                        Spacer()
                                        if viewModel.selectedCurrencyId == curr.id {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(Color("AccentColor"))
                                                .transition(.opacity)
                                        }
                                    }
                                })
                            }
                        } header: {
                            if filterText == "" {
                                Text("label_allcurrencies".localized)
                            } else {
                                Text("")
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
        .background(Color("MainBackground"))
        .navigationBarTitle("title_selcurrency".localized, displayMode: .inline)
        .onAppear { viewModel.loadData() }
    }
}

#Preview {
    CurrencyEditorView(viewModel: CurrencyEditorViewModel.init(managersContainer: .getForPreview()))
}
