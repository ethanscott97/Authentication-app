//
//  VerifyImageController.swift
//  Authentication
//
//  Created by Ethan Scott on 4/22/21.
//

import UIKit

class VerifyImageController {
    static let buses = [VerifyImage(name: "School Bus", image: UIImage(named: "schoolBus"), correct: true),
                        VerifyImage(name: "Red Bus", image: UIImage(named: "redBus"), correct: true),
                        VerifyImage(name: "Green Bus", image: UIImage(named: "greenBus"), correct: true),
                        VerifyImage(name: "Gray Bus", image: UIImage(named: "grayBus"), correct: true),
                        VerifyImage(name: "Blue Bus", image: UIImage(named: "blueBus"), correct: true)]
    
    static let animals = [VerifyImage(name: "Bear", image: UIImage(named: "bear"), correct: false),
                          VerifyImage(name: "Chicken", image: UIImage(named: "chicken"), correct: false),
                          VerifyImage(name: "Donkey", image: UIImage(named: "donkey"), correct: false),
                          VerifyImage(name: "Elephant", image: UIImage(named: "elephant"), correct: false),
                          VerifyImage(name: "Monkey", image: UIImage(named: "monkey"), correct: false),
                          VerifyImage(name: "Eagle", image: UIImage(named: "eagle"), correct: false)]
    
}//End of class
