//
//  Pets.swift
//  pet-app
//
//  Created by Ege Çavuşoğlu on 10/1/20.
//  Copyright © 2020 Ege Çavuşoğlu. All rights reserved.
//

import Foundation

class Pets {
    var dog: Pet
    var cat: Pet
    init() {
        dog = Pet(pet: PetEnums.Dog)
        cat = Pet(pet: PetEnums.Cat)
    }
    func feed(pet:Pet){
        pet.food += 10
    }
}
