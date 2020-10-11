//
//  ViewController.swift
//  pet-app
//
//  Created by Ege Çavuşoğlu on 9/28/20.
//  Copyright © 2020 Ege Çavuşoğlu. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var petTextView: UIView!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petDescription: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet var petButtons: [UIButton]!
    @IBOutlet weak var happinessLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var foodBar: DisplayView!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var width: NSLayoutConstraint!
    
    
    
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
        resetFuncfact(animated: false)
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
        happinessBar.color = pet.background
        foodBar.color = pet.background
        happinessBar.animateValue(to: CGFloat(pet.happiness) / 10.0, animated: false)
        foodBar.animateValue(to: CGFloat(pet.food) / 10.0, animated: false)

    }
    
    @IBAction func changePet(_ sender: UIButton) {
        resetFuncfact(animated: false)
        activePet = sender.tag
        renderPet(pet:petDic[activePet]!)
    }
    
    @IBAction func play(_ sender: Any) {
        resetFuncfact(animated: false)
        let p = petDic[activePet]!
        p.play()
        happinessBar.animateValue(to: CGFloat(p.happiness) / 10.0, animated:true)
        foodBar.animateValue(to: CGFloat(p.food) / 10.0, animated:true)
        renderPet(pet:petDic[activePet]!)
        
    }
    @IBAction func funfactButton(_ sender: Any) {
        let text = petDic[activePet]?.funfact
        self.petDescription.text = text
        let utterance = AVSpeechUtterance(string: text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear, animations: {
            self.height.constant = 140
            self.width.constant = 250
            self.petDescription.alpha = 1
            self.view.layoutIfNeeded()
                    }) { (success: Bool) in
          let synth = AVSpeechSynthesizer()
          synth.speak(utterance)
          }
    }
    
    @IBAction func feed(_ sender: Any) {
        let p = petDic[activePet]!
        p.feed()
        foodBar.animateValue(to: CGFloat(p.food) / 10.0, animated:true)
        renderPet(pet:petDic[activePet]!)
        resetFuncfact(animated: true)
    }
    
   
    
    func resetFuncfact (animated:Bool) {
        if (animated){
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear, animations: {
              self.height.constant = 0
              self.width.constant = 0
              self.petDescription.alpha = 0
              self.view.layoutIfNeeded()
                      })
        }
        else{
            height.constant = 0
            width.constant = 0
            petDescription.alpha = 0;
        }
        self.petDescription.text = ""
    }
    
}

