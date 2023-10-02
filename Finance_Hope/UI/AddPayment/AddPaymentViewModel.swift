//
//  AddPaymentViewModel.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation
import Combine

class AddPaymentViewModel: BaseViewModel {
    @Published var isError: Bool = false
    @Published var errorText: String = ""
    @Published var priceText: String = ""
    @Published var nameText: String = ""
    @Published var aboutText: String = ""
    @Published var spendingBool: Bool = true
    
    override func loadData() {
        
    }
    
    func addPayment(price: Float, about: String, name: String) {
        _ = paymentsManager.addPayment(price: price, about: about, name: name)
    }
    
    /// Try add new payment
    func tryAddPayment(onSuccess: () -> Void) {
        // check validation
        if !PriceExpressionValidator.validate(str: priceText) {
            errorText = MathExpressionError.invalidExpression.localizedDescription
            isError = true
        }
        
        let priceStr = priceText.replacingOccurrences(of: ",", with: ".")
        let mathExp = MathematicalExpression(line: priceStr)
        do {
            let sum = try mathExp.calculate()
            guard let value = Float(spendingBool ? "-\(sum)" : "\(sum)") else { return }
            let about = aboutText
            let name = nameText
            
            addPayment(price: value, about: about, name: name)
            
            priceText = ""
            aboutText = ""
            nameText = ""
            spendingBool = true
            
            onSuccess()
        } catch let error {
#if DEBUG
            print(error)
#endif
            
            errorText = error.localizedDescription
            isError = true
        }
    }
    
    func showError() { isError = true}
}
