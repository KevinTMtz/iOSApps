//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kevin Torres on 17/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            switch symbol {
            case "AC":
                return 0.0
            case "+/-":
                return num * -1
            case "%":
                return num * 0.01
            case "=":
                return performTwoNumberCalculation(n2: num)
            default:
                intermediateCalculation = (n1: num, operation: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                if (n2 == 0.0) {
                    return n1
                }
                return n1 / n2
            default:
                fatalError("Operation does not match any of the cases.")
            }
        }
        
        return nil
    }
}
