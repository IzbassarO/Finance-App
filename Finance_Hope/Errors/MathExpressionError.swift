//
//  MathExpressionError.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation
import SwiftUI

enum MathExpressionError: LocalizedError {
    case invalidExpression
    case invalidOperator(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidExpression:
            return "mathexpressionerror_invalid".localized
        case .invalidOperator:
            return "mathexpressionerror_invalidoperator".localized
        }
    }
}
