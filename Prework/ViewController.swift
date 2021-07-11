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
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myInt")
        
        if defaults.string(forKey: "myString1") != nil {
            tipControl.setTitle(defaults.string(forKey: "myString1"), forSegmentAt: 0)
        }
        if defaults.string(forKey: "myString2") != nil {
            tipControl.setTitle(defaults.string(forKey: "myString2"), forSegmentAt: 1)
        }
        if defaults.string(forKey: "myString3") != nil {
            tipControl.setTitle(defaults.string(forKey: "myString3"), forSegmentAt: 2)
        }
        
        if defaults.string(forKey: "billAmount") != nil {
            BillAmountTextField.text = defaults.string(forKey: "billAmount")
        }
        
        calculateTip(nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
    }
    
//  remember last bill amount once the user leaves the app
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        defaults.setValue(BillAmountTextField.text, forKey: "billAmount")
    }
    
    @IBAction func TextFieldOnEnter(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.setValue(BillAmountTextField.text, forKey: "billAmount")
        
        calculateTip(nil)
    }
    @IBAction func calculateTip(_ sender: Any?) {
//        Get the initial bill amount and calculate the tips
//        Calculate the total cost
//        Update the tip and total labels
          let defaults = UserDefaults.standard
          
//        Conversion of percentage to float
        
        let copy1 = defaults.string(forKey: "myString1")!
        let copy2 = defaults.string(forKey: "myString2")!
        let copy3 = defaults.string(forKey: "myString3")!
        
        let index1 = copy1.index(copy1.endIndex, offsetBy: -1)
        let substr1 = copy1[..<index1]
        let index2 = copy2.index(copy2.endIndex, offsetBy: -1)
        let substr2 = copy2[..<index2]
        let index3 = copy3.index(copy3.endIndex, offsetBy: -1)
        let substr3 = copy3[..<index3]
        
        let str1 = String(substr1)
        let str2 = String(substr2)
        let str3 = String(substr3)
        
        let opt1 = (Double(str1) ?? 0.0) / 100
        let opt2 = (Double(str2) ?? 0.0) / 100
        let opt3 = (Double(str3) ?? 0.0) / 100
        
        let bill = Double(BillAmountTextField.text!) ?? 0
        let tipOptions: [Double] = [opt1, opt2, opt3]
        let tip = bill * tipOptions[tipControl.selectedSegmentIndex]
        let total = tip + bill

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
}

