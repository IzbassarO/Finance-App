//
//  SearchBarView.swift
//  Finance_Hope
//
//  Created by Izbassar on 12.10.2023.
//

import SwiftUI

/// Search bar view
struct SearchBarView: View {
    @Binding var text: String
    var hint: String
    @State private var isButtonShown = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    TextField(hint, text: $text) { (editingChanged) in
                        isButtonShown = editingChanged
                    }
                    .foregroundColor(Color("DefaultText"))
                    .padding(.vertical, 8)
                    
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .padding(.trailing, 8)
                        .foregroundColor(.gray)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("SearchBarBackground")))
                
                if isButtonShown {
                    Button {
                        buttonClicked()
                    } label: {
                        Text("btn_cancel".localized)
                    }
                    .padding(.leading, 8)
                    .buttonStyle(.plain)
                }
            }
        }
        .animation(.default, value: isButtonShown)
        .multilineTextAlignment(.leading)
        .padding(.horizontal)
        .padding(.vertical, 3)
    }
    
    private func buttonClicked() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isButtonShown = false
    }
}

#Preview {
    SearchBarView(text: .constant(""), hint: "Search")
}
