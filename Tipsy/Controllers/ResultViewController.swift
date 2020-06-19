//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var Result : String = "0.0"
       var SplitNumber : Int = 2
       var Tipvalue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = Result
        settingsLabel.text = "Split between \(SplitNumber) people, with \(Tipvalue)% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
