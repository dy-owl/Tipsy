//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dmytro Yantsybaiev on 27.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var amountToPay: String?
    var numberOfPeople: String?
    var tipPst: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = amountToPay
        settingsLabel.text = "Split between \(numberOfPeople ?? "2") people, with \(tipPst ?? "10") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
