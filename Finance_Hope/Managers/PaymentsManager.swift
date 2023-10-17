//
//  PaymentsManager.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import Foundation
import CoreData

/// Manager for payments
struct PaymentsManager {
    private var viewContext = PersistenceController.shared.container.viewContext
    
    ///Add new payment
    func addPayment(price: Float, about: String, name: String) -> Payment {
        let payment = Payment(context: viewContext)
        payment.price = Float(price)
        payment.about = about
        payment.date = Date()
        payment.name = name
        
        try? viewContext.save()
        return payment
    }
    
    /// Remove payment by in index
    func removePayment(index: Int) {
        viewContext.delete(getPayments()[index])
        try? viewContext.save()
    }
    
    ///Remove payment by in payment
    func removePayment(payment: Payment) {
        viewContext.delete(payment)
        try? viewContext.save()
    }
    
    func getPayments() -> [Payment] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Payment")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Payment.date, ascending: true)]
        do {
            let array = try viewContext.fetch(request) as? [Payment]
            if let array = array {
                return array.reversed()
            }
        } catch let err {
            print("Failed to get an index of payment. \(err)")
        }
        
        return []
    }
    
    /// Remove all payments
    func removeAll() {
        getPayments().forEach { _ in
            removePayment(index: 0)
        }
    }
}
