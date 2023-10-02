//
//  MathematicalExpression.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

class MathematicalExpression {
    private let line: String
    
    init(line: String) {
        self.line = line
    }
    
    /// Parse expression string
    func parse() throws -> [Float] {
        let values = line.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .compactMap { Float($0) }
        
        if values.isEmpty {
            throw MathExpressionError.invalidExpression
        }
        
        return values
    }
    
    /// Calculate expression
    func calculate() throws -> Float {
        let values = try parse()
        
        guard let firstValue = values.first else {
            throw MathExpressionError.invalidExpression
        }
        
        var result = firstValue
        
        for index in stride(from: 1, to: values.count, by: 2) {
            if index + 1 < values.count {
                let operatorValue = values[index]
                let nextValue = values[index + 1]
                
                if operatorValue == 1 { // 1 represents addition
                    result += nextValue
                } else if operatorValue == -1 { // -1 represents subtraction
                    result -= nextValue
                } else {
                    throw MathExpressionError.invalidOperator("\(operatorValue)")
                }
            }
        }
        
        return result
    }
}
