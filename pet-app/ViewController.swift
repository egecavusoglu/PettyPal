//
//  ViewController.swift
//  pet-app
//
//  Created by Ege Çavuşoğlu on 9/28/20.
//  Copyright © 2020 Ege Çavuşoğlu. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet var petButtons: [UIButton]!
    @IBOutlet weak var happinessLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var happinessBar: UIView!
    @IBOutlet weak var foodBar: UIView!
    
    // App State
    var activePet = 0
    var dog = Pet(pet:.Dog)
    var cat = Pet(pet:.Cat)
    var bird = Pet(pet:.Bird)
    var bunny = Pet(pet:.Bunny)
    var fish = Pet(pet:.Fish)
    var petDic: Dictionary< Int, Pet> = [:]
    var foodView = DisplayView.init(frame: CGRect())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        petDic = [
            0: dog,
            1: cat,
            2: bird,
            3: bunny,
            4: fish
        ]
        foodView = DisplayView.init(frame: foodBar.frame)
        renderPet(pet: dog)
    }
    
    func renderPet(pet: Pet){
        petImage.image = pet.image
        background.backgroundColor = pet.background
        happinessLabel.text = String(pet.totalHappiness)
        foodLabel.text = String(pet.totalFood)
    }
    
    @IBAction func changePet(_ sender: UIButton) {
        activePet = sender.tag
        renderPet(pet:petDic[activePet]!)
    }
    
    @IBAction func play(_ sender: Any) {
        petDic[activePet]!.play()
        renderPet(pet:petDic[activePet]!)
    }
    
    
    @IBAction func feed(_ sender: Any) {
        let p = petDic[activePet]!
        p.feed()
        foodView.animateValue(to: CGFloat(p.food) / 10.0)
        renderPet(pet:petDic[activePet]!)
    }
    
}

