//
//  SettingsViewController.swift
//  Prework
//
//  Created by Matthew Piedra on 7/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipPercentages: UISegmentedControl!
    @IBOutlet weak var default1: UITextField!
    @IBOutlet weak var default2: UITextField!
    @IBOutlet weak var default3: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        defaultTipPercentages.selectedSegmentIndex = defaults.integer(forKey: "myInt")

        if defaults.string(forKey: "myString1") != nil {
            defaultTipPercentages.setTitle(defaults.string(forKey: "myString1"), forSegmentAt: 0)
        }
        if defaults.string(forKey: "myString2") != nil {
            defaultTipPercentages.setTitle(defaults.string(forKey: "myString2"), forSegmentAt: 1)
        }
        if defaults.string(forKey: "myString3") != nil {
            defaultTipPercentages.setTitle(defaults.string(forKey: "myString3"), forSegmentAt: 2)
        }
        
        default1.text = defaultTipPercentages.titleForSegment(at: 0)
        default2.text = defaultTipPercentages.titleForSegment(at: 1)
        default3.text = defaultTipPercentages.titleForSegment(at: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        let defaultTipPerc =  defaultTipPercentages.selectedSegmentIndex
        
        defaults.set(defaultTipPerc, forKey: "myInt")
        
        defaults.set(default1.text, forKey: "myString1")
        defaults.set(default2.text, forKey: "myString2")
        defaults.set(default3.text, forKey: "myString3")
        
        defaults.synchronize()
    }

    @IBAction func firstTip(_ sender: Any) {
        defaultTipPercentages.setTitle(default1.text, forSegmentAt: 0)
    }
    
    @IBAction func secondTip(_ sender: Any) {
        defaultTipPercentages.setTitle(default2.text, forSegmentAt: 1)
    }

    @IBAction func thirdTip(_ sender: Any) {
        defaultTipPercentages.setTitle(default3.text, forSegmentAt: 2)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
