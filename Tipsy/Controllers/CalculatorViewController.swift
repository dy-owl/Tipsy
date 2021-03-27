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
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UIView!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        setSelectedButton(button: sender.self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
    func setSelectedButton(button: UIButton) {
        let pctButtons = [zeroPctButton, tenPctButton, twentyPctButton]
        for pctButton in pctButtons {
            if pctButton == button {
                pctButton?.isSelected = true
            } else {
                pctButton?.isSelected = false
            }
        }
    }

}

