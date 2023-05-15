//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var globalTip : Float = 0.0
    var splitAmount = 0
    
    
    func getBillText() -> String {
        var newBill = ""
        newBill = self.billTextField.text ?? "No Number found"
        return newBill
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.currentTitle == "0%" {
//            print(sender.currentTitle)
            globalTip = 0.0
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            zeroPctButton.isSelected = true
        } else if  sender.currentTitle == "10%" {
//            print(sender.currentTitle)
            globalTip = 0.1
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = true

        } else {
//            print(sender.currentTitle)
            globalTip = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true

        }
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitAmount = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var billNoTipYet = Float(getBillText()) ?? 0.0
        print(billNoTipYet)
        print(globalTip)
        
        var totalBillCalc = Float(((billNoTipYet*globalTip) + billNoTipYet) / Float(splitAmount))
        print(totalBillCalc)
        
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }


}

