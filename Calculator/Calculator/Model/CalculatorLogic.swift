//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kevin Torres on 17/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "AC" {
            return 0.0
        } else if symbol == "+/-" {
            return number * -1
        } else if symbol == "%" {
            return number * 0.01
        }
        return nil
    }
}
