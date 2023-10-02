//
//  MathExpressionError.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

enum MathExpressionError: LocalizedError {
    case invalidExpression
    case invalidOperator(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidExpression:
            return "mathexpressionerror_invalid"
        case .invalidOperator(let opera):
            return "mathexpressionerror_invalidoperator".localizedWithPlaceholder(arguments: opera)
        }
    }
}
