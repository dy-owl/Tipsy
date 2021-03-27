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
    var pctValue: Float = -1.0

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
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(pctValue)
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
            pctValue = 0.0
        } else if pressedButton == tenPctButton {
            pctValue = 0.1
        } else if pressedButton == twentyPctButton {
            pctValue = 0.2
        } else {
            pctValue = -1.0
        }
    }

}

