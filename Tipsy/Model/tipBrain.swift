//
//  tipBrain.swift
//  Tipsy
//
//  Created by Yoonsoo Park on 1/23/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tipPercentage : Int?
    var numberOfPeople : Int?
    var currentBill : Float  = 0.0
    var currentTipsPerEach : Float = 0.0
    
    func getNumberOfPeople() -> Int {
        return numberOfPeople ?? 1
    }
    
    func getTipPercentage() -> Int {
        return tipPercentage ?? 10
    }
    
    mutating func calculateTips() -> Float {
        print("people: \(numberOfPeople) tip% : \(tipPercentage) bill : \(currentBill)")
        self.currentTipsPerEach = (currentBill * Float(tipPercentage ?? 20) / 100) / Float(numberOfPeople!)
        return self.currentTipsPerEach
    }
}
