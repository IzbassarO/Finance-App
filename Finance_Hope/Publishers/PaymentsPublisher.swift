//
//  PaymentsPublisher.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation
import Combine

/// Publisher for loading payments
struct PaymentsPublisher: Publisher {
    typealias Output = [Payment]
    typealias Failure = Never
    
    let paymentsManager: PaymentsManager
    
    func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, [Payment] == S.Input {
        let payments = paymentsManager.getPayments()
        _ = subscriber.receive(payments)
    }
}
