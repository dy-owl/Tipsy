//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var selectedButton: UIButton?
    var bill: Float = 0
    var tipPct: Float = 0.1
    var numberOfPeople: Float = 2
    var amountToPay: Float = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectedButton(pressedButton: tenPctButton)
        setPctValue(pressedButton: tenPctButton)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        setSelectedButton(pressedButton: sender.self)
        setPctValue(pressedButton: sender.self)
        billTextField.endEditing(true)
        
        if let safeBillText = Float(billTextField.text!) {
            bill = safeBillText
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Float(sender.value)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let tip = bill * tipPct
        let totalBill = bill + tip
        amountToPay = totalBill / numberOfPeople
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.amountToPay = String(format: "%.2f", amountToPay)
            destinationVC.numberOfPeople = String(format: "%.0f", numberOfPeople)
            destinationVC.tipPst = selectedButton?.currentTitle
        }
    }
    
    func setSelectedButton(pressedButton: UIButton) {
        let pctButtons = [zeroPctButton, tenPctButton, twentyPctButton]
        for pctButton in pctButtons {
            if pctButton == pressedButton {
                selectedButton = pctButton
                pctButton?.isSelected = true
            } else {
                pctButton?.isSelected = false
            }
        }
    }
    
    func setPctValue(pressedButton: UIButton) {
        if pressedButton == zeroPctButton {
            tipPct = 0.0
        } else if pressedButton == tenPctButton {
            tipPct = 0.1
        } else if pressedButton == twentyPctButton {
            tipPct = 0.2
        } else {
            tipPct = -1.0
        }
    }

}

