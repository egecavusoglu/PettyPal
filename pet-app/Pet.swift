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
    PetEnums.Dog:  [UIImage.init(named: "Dog")!, UIColor.systemIndigo, "Huskies have a thick double coat that keeps them well insulated."],
    PetEnums.Cat:  [UIImage.init(named: "Cat")!, UIColor.orange, "A house cat is genetically 95.6% tiger."],
    PetEnums.Bird:  [UIImage.init(named: "Bird")!, UIColor.yellow, "Parrots are believed to be one of the most intelligent bird species."],
    PetEnums.Bunny:  [UIImage.init(named: "Bunny")!, UIColor.systemPurple, "A rabbit's teeth never stop growing."],
    PetEnums.Fish:  [UIImage.init(named: "Fish")!, UIColor.systemTeal, "There are over 30000 known species of fish."],
    
]
class Pet {
    var image:UIImage
    var happiness: Int
    var totalHappiness: Int
    var food: Int
    var totalFood: Int
    var background: UIColor
    var funfact: String
    init(pet: PetEnums) {
        image = petDictionary[pet]![0] as! UIImage
        background = petDictionary[pet]![1] as! UIColor
        happiness = 0
        totalHappiness = 0
        food = 0
        totalFood = 0
        funfact = petDictionary[pet]![2] as! String
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
