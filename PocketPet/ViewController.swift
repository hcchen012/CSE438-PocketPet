//
//  ViewController.swift
//  PocketPet
//
//  Created by Hannah Chen on 9/12/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var happyBar: DisplayView!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodBar: DisplayView!
    
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var birdButton: UIButton!
    @IBOutlet weak var bunnyButton: UIButton!
    @IBOutlet weak var fishButton: UIButton!
    
    enum CustomColor {
        
        static let customBackgroundColor  = UIColor(named: "BackgroundColor")
        static let customButtonColor = UIColor(named: "ButtonBGColor")
        static let customLabelColor = UIColor(named: "LabelColor")
        static let customDogColor = UIColor(named: "DogColor")
        static let customCatColor = UIColor(named: "CatColor")
        static let customBirdColor = UIColor(named: "BirdColor")
        static let customBunnyColor = UIColor(named: "BunnyColor")
        static let customFishColor = UIColor(named: "FishColor")
    }
    
    var currPet:Pet!
    
    var dog:Pet?
    var cat:Pet?
    var bird:Pet?
    var bunny:Pet?
    var fish:Pet?
    
    //Reference for sounds: https://stackoverflow.com/questions/32036146/how-to-play-a-sound-using-swift
    var player: AVAudioPlayer?
    
    func playSound(name:String) {
        guard let path = Bundle.main.path(forResource: name, ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Extra Credit: light/dark mode
        view.backgroundColor = CustomColor.customBackgroundColor
        
        happyBar.color = CustomColor.customButtonColor ?? UIColor.lightGray
        foodBar.color = CustomColor.customButtonColor ?? UIColor.lightGray
        
//        playButton.backgroundColor = CustomColor.customButtonColor
//        feedButton.backgroundColor = CustomColor.customButtonColor
////        levelLabel.textColor = CustomColor.customLabelColor
//        happyLabel.textColor = CustomColor.customLabelColor
//        foodLabel.textColor = CustomColor.customLabelColor
        
        
        guard let dogPic = UIImage(named: "dog") else {
            print("dog image is nil")
            return
        }
        dog = Pet(type: "dog", color: CustomColor.customDogColor ?? UIColor(red:217/255.0, green:153/255.0, blue: 220/255.0, alpha: 0.5), image: dogPic)
        
        guard let catPic = UIImage(named: "cat") else {
            print("cat image is nil")
            return
        }
        cat = Pet(type: "cat", color: CustomColor.customCatColor ?? UIColor(red: 243/255.0, green: 154/255.0, blue: 80/255.0, alpha: 0.5), image: catPic)
        
        guard let birdPic = UIImage(named: "bird") else {
            print("bird image is nil")
            return
        }
        bird = Pet(type: "bird", color: CustomColor.customBirdColor ?? UIColor(red: 255/255.0, green: 255/255.0, blue: 156/255.0, alpha: 0.5), image: birdPic)
        
        guard let bunnyPic = UIImage(named: "bunny") else {
            print("bunny image is nil")
            return
        }
        bunny = Pet(type: "bunny", color: CustomColor.customBunnyColor ?? UIColor(red: 214/255.0, green: 225/255.0, blue: 173/255.0, alpha: 0.5), image: bunnyPic)
        
        guard let fishPic = UIImage(named: "fish") else {
            print("fish image is nil")
            return
        }
        fish = Pet(type: "fish", color: CustomColor.customFishColor ?? UIColor(red: 53/255.0, green: 155/255.0, blue: 220/255.0, alpha: 0.5), image: fishPic)
        
        currPet = dog
        updatePet()
    }
    
    
    @IBAction func playClicked(_ sender: Any) {
        let level = currPet.level
        currPet.play()
//        print("played")
        if (currPet.foodLevel > currPet.level-1){
            switch currPet.type{
            case "dog":
                playSound(name: "dogBark")
            case "cat":
                playSound(name: "catMeow")
            case "bird":
                playSound(name: "birdChirp")
            case "bunny":
                playSound(name: "bunnyBounce")
            case "fish":
                playSound(name: "fishSplash")
            default:
                return
            }
        }
        if (currPet.level != level && level == 10){
            playSound(name: "evolveSound")
        }
        else if (currPet.level != level){
            playSound(name: "levelSound")
        }
        updateDisp()
        evolveDisp()
    }
    
    @IBAction func feedClicked(_ sender: Any) {
        currPet.feed()
//        print("fed")
        updateDisp()
    }
    
    //Reference for accessing buttons: https://stackoverflow.com/questions/30046540/get-button-pressed-id-on-swift-via-sender
    @IBAction func changedPet(_ sender: UIButton) {
        switch sender{
        case dogButton:
            currPet = dog
            updatePet()
        case catButton:
            currPet = cat
            updatePet()
        case birdButton:
            currPet = bird
            updatePet()
        case bunnyButton:
            currPet = bunny
            updatePet()
        case fishButton:
            currPet = fish
            updatePet()
        default:
            return
        }
    }
    
    func updatePet(){
//        print("update pet")
        petImage.image = currPet.image
        background.backgroundColor = currPet.color
        happyBar.color = currPet.color
        foodBar.color = currPet.color
        
        //jump to right values, no animation
        happyBar.value = Double(currPet.happinessLevel) / 10
        foodBar.value = Double(currPet.foodLevel) / 10
        updateDisp()
//        print(currPet.type)
    }
    
    func updateDisp(){
        //Valid range is between 0 and 1.
        let hvalue = Double(currPet.happinessLevel) / 10
//        print("happy bar: " + String(hvalue))
        happyBar.animateValue(to: CGFloat(hvalue))
        
        happyLabel.text = "played: " + String(currPet.playedAmt)
        
        let fvalue = Double(currPet.foodLevel) / 10
//        print(currPet.foodLevel)
//        print("food bar: " + String(fvalue))
        foodBar.animateValue(to: CGFloat(fvalue))
        
        foodLabel.text = "fed: " + String(currPet.fedAmt)
        
        levelLabel.text = "Level: " + String(currPet.level)
    }
    
    func evolveDisp(){
        petImage.image = currPet.image
    }
    

}

