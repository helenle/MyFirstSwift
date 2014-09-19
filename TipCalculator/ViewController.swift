//
//  ViewController.swift
//  TipCalculator
//
//  Created by Huyen Le on 9/18/14.
//  Copyright (c) 2014 Huyen Le. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    
    
    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""

        var keys = Array(possibleTips.keys)
        sort(&keys)
        for tipPct in keys {
            let tipValue = possibleTips[tipPct]!
            let prettyTipValue = String(format:"%.2f", tipValue)
            results += "\(tipPct)%: $\(prettyTipValue)\n"
        }
        
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
        
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    let tipCalc = TipCalculatorModel(total: 50.00, taxPct: 0.09)
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100
        taxPctLabel.text = "Tax \(Int(taxPctSlider.value))%"
        
        resultsTextView.text = ""
    }

}



