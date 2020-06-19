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
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
   var tipCalculated :Double = 0.00 //initializing the value of the tip
    var numberOfPeople :Int = 2 // the least number that the total will be divided by
    var totalBill = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //we give all selected option fasle option
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        //the only one work is the sender one
        sender.isSelected = true
        //get the string value that is in the button that is selected
        let selectedButtonValue = sender.currentTitle!
        //droping the percentage from the string
        let selectedButtonValueWithoutPercentage = String (selectedButtonValue.dropLast())
        //converting the value to double
        let buttonDoubleValue = Double (selectedButtonValueWithoutPercentage)!
        tipCalculated = buttonDoubleValue / 100
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton)
    {
        let Bill = billTextField.text!
        if Bill != ""
        {
            totalBill = Double(Bill)!
            let result = totalBill * (1 + tipCalculated) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "GoToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.Result = finalResult
            destinationVC.SplitNumber = numberOfPeople
            destinationVC.Tipvalue = Int(tipCalculated * 100)
        }

    }
}
