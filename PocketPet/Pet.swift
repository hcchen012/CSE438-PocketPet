//
//  Pet.swift
//  PocketPet
//
//  Created by Hannah Chen on 9/24/22.
//

import Foundation
import UIKit

class Pet{
    var type:String
    var color:UIColor
    var image:UIImage
    var happinessLevel = 0
    var playedAmt = 0
    var foodLevel = 0
    var fedAmt = 0
    var level = 1
    
    init(type:String, color:UIColor, image:UIImage){
        self.type = type
        self.color = color
        self.image = image
        self.happinessLevel = 0
        self.playedAmt = 0
        self.foodLevel = 0
        self.fedAmt = 0
        self.level = 1
    }
    
    //play function
    func play()
    {
        if (self.foodLevel > level-1){
            //bar goes up to 10
            if (self.happinessLevel < 10){
                self.happinessLevel += 1
//                print(happinessLevel)
            }
            //bar at 10, now pet levels up, bar goes to 1
            else{
                self.happinessLevel = 1
                levelUp()
            }
            self.foodLevel -= level
            self.playedAmt += 1
        }
    }
    
    //feed function
    func feed()
    {
        if (self.foodLevel < 10){
            self.foodLevel += 1
        }
        self.fedAmt += 1
    }
    
    func levelUp()
    {
        //can make this threshold lower for easier testing
        if (self.level < 10)
        {
            self.level += 1
        }
        else{
            self.level = 1
            evolve()
        }
    }
    
    func evolve()
    {
//        print(self.type)
        switch self.type{
        case "dog":
            guard let wolfPic = UIImage(named: "wolf") else {
                print("wolf image is nil")
                return
            }
            self.image = wolfPic
            print("wolf image")
        case "cat":
            guard let pantherPic = UIImage(named: "panther") else {
                print("panther image is nil")
                return
            }
            self.image = pantherPic
        case "bird":
            guard let dragonPic = UIImage(named: "dragon") else {
                print("dragon image is nil")
                return
            }
            self.image = dragonPic
        case "bunny":
            guard let kangarooPic = UIImage(named: "kangaroo") else {
                print("kangaroo image is nil")
                return
            }
            self.image = kangarooPic
        case "fish":
            guard let whalePic = UIImage(named: "whale") else {
                print("whale image is nil")
                return
            }
            self.image = whalePic
        default:
            return
        }
    }
    
    
}
