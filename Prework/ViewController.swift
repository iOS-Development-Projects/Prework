//
//  ViewController.swift
//  Prework
//
//  Created by Matthew Piedra on 7/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
//        Get the initial bill amount and calculate the tips
//        Calculate the total cost
//        Update the tip and total labels
        
          let bill = Double(BillAmountTextField.text!) ?? 0
          let tipOptions = [0.15, 0.18, 0.20]
          let tip = bill * tipOptions[tipControl.selectedSegmentIndex]
          let total = tip + bill
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
}

