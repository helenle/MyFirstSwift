//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Huyen Le on 9/18/14.
//  Copyright (c) 2014 Huyen Le. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    // Variables
    var total: Double
    var taxPct: Double
    
    var subTotal: Double { // subTotal is pre-tax for calculating the possible tips
        
        get { // getter()
            return total / (taxPct + 1)
        }
        set (newSubTotal) { // setter()
            // ...
        }
    }
    
    
    
    // initializer
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    // Method to calculate tip: need to explicit with the type
    func calcTip(tipPct: Double) -> Double {
        return subTotal * tipPct
    }
    
    // Method to print summary of total
    func printTotal() {
        println("SubTotal: $\(subTotal)")
        println("Tax: \(taxPct * 100)%")
        println("Total: $\(total)")
    }
    
    // Method to print possible tips
    func printPossibleTips() {
        let possibleTips = [0.10, 0.15, 0.18, 0.20]
        
        println("----- Possible Tips ----- ")
        for possibleTip in possibleTips {
            println("\(possibleTip * 100)%: $\(calcTip(possibleTip))")
        }
        println("Thank you for coming!")
    }
    
    
    func returnPossibleTips() -> [Int : Double] {
        let possibleTips = [0.10, 0.15, 0.18,0.20]
    
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTip(possibleTip)
        }
        return retval
    }
        
}



