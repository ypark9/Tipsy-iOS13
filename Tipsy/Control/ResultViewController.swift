//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Yoonsoo Park on 1/23/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var tipForEachLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    var tipBrain : TipBrain?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("tips : \(String(describing: tipBrain!.calculateTips()))")
        tipForEachLabel.text = String(describing: tipBrain!.calculateTips())
        let percentage = tipBrain!.tipPercentage
        var people = tipBrain!.numberOfPeople
        explainLabel.text = "Split between \(people!) people, with \(percentage!)% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
