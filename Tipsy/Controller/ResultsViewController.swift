//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Arda Büyükhatipoğlu on 22.03.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBillPerPerson: Float?
    var split: Float?
    var tip: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalBillPerPerson!)
        settingsLabel.text = "Split between \(Int(split ?? 0)) people, with %\(Int(tip! * 100)) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
