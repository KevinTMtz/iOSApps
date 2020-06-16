//
//  CalculatorBrain.swift
//  Tip Calculator
//
//  Created by Kevin Torres on 16/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bill: Bill?

    mutating func calculateTip(totalBillString: String, tipPercentage: Double, peopleToSplit: Double) {
        let totalBill = Double(totalBillString)!
        
        let totalPerPerson = (totalBill + totalBill * tipPercentage) / peopleToSplit
        
        bill = Bill(totalBill: totalBill, tipPercentage: tipPercentage, peopleToSplit: peopleToSplit, totalPerPerson: totalPerPerson)
    }
    
    func getPeopleToSplit() -> String {
        return String(Int(bill?.peopleToSplit ?? 1))
    }
    
    func getTip() -> String {
        return String(Int((bill?.tipPercentage ?? 0.1) * 100.0))
    }
    
    func getTotalPerPerson() -> String {
        return String(format: "%.2f", bill?.totalPerPerson ?? 0.0)
    }
}
