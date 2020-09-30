//
//  pets.swift
//  pet-app
//
//  Created by Ege Çavuşoğlu on 9/30/20.
//  Copyright © 2020 Ege Çavuşoğlu. All rights reserved.
//

import Foundation
import UIKit

enum PetEnums {
    case Dog
    case Cat
    case Bird
    case Bunny
    case Fish
}
let petDictionary = [
    PetEnums.Dog:  [UIImage.init(named: "Dog")!, UIColor.systemIndigo],
    PetEnums.Cat:  [UIImage.init(named: "Cat")!, UIColor.orange],
    PetEnums.Bird:  [UIImage.init(named: "Bird")!, UIColor.yellow],
    PetEnums.Bunny:  [UIImage.init(named: "Bunny")!, UIColor.systemPurple],
    PetEnums.Fish:  [UIImage.init(named: "Fish")!, UIColor.systemTeal],
    
]
class Pet {
    var image:UIImage
    var happiness: Int
    var totalHappiness: Int
    var food: Int
    var totalFood: Int
    var background: UIColor
    init(pet: PetEnums) {
        image = petDictionary[pet]![0] as! UIImage
        background = petDictionary[pet]![1] as! UIColor
        happiness = 0
        totalHappiness = 0
        food = 0
        totalFood = 0
    }
    
    func feed() {
        if (food >= 0 && food < 10){
            food += 1
            totalFood += 1
        }
    }
    
    func play() {
        if (food > 0){
            happiness += 1
            totalHappiness += 1
            food -= 1
        }
    }
}
