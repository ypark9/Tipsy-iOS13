//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var tip20Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var CurrentBillTextField: UITextField!
    
    var tipBrain = TipBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // let numberOfPeople = Int(numberOfPeopleLabel.text ?? "2") ?? 2
        tipBrain.currentBill = 0
        tipBrain.numberOfPeople = 2
        tipBrain.tipPercentage = 20
    }

    @IBAction func inputBillTextField(_ sender: UITextField) {
            tipBrain.currentBill = Float(sender.text!)!
        print("input processed : Bill = \(tipBrain.currentBill)")
    }
    
    @IBAction func tipPercentPressed(_ sender: UIButton) {
        let percentage = sender.titleLabel!.text
        tipBrain.tipPercentage = Int(percentage!)
        sender.isSelected = true;
        if(sender.titleLabel!.text == "10%")
        {
            tip20Button.isSelected = false
            tip0Button.isSelected = false
        }
        else if(sender.titleLabel!.text == "0%")
        {
            tip20Button.isSelected = false
            tip10Button.isSelected = false

        }
        else if(sender.titleLabel!.text == "20%")
        {
            tip10Button.isSelected = false
            tip0Button.isSelected = false

        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let curPeopleNumber = sender.value
        tipBrain.numberOfPeople = Int(curPeopleNumber)
    }
    
    @IBAction func calculateTipPressed(_ sender: UIButton) {
        
        tipBrain.currentBill = Float(CurrentBillTextField.text ?? "10") ?? 10
        print("input processed : Bill = \(tipBrain.currentBill)")

        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let resultVC =  segue.destination as! ResultViewController
            resultVC.tipBrain = tipBrain
        }
    }
}

