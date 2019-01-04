//
//  ViewController.swift
//  Draw Fast
//
//  Created by Lauren Choi on 1/2/19.
//  Copyright © 2019 Lauren Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newPrompt: UIButton!
    @IBOutlet weak var newSubject: UILabel!
    @IBOutlet weak var newAction: UILabel!
    @IBOutlet weak var newSetting: UILabel!
    
    // Library of randomized prompts
    
    let subjects = ["A horse", "A turtle", "A cat", "A parrot", "An eel", "A spider", "A lion", "A giraffe", "A bear", "A rabbit", "A pine tree", "A palm tree", "A rose", "A daisy", "A ship", "A fork", "A spoon", "A marshmallow", "A lightbulb", "A chair", "You", "An old lady", "A young man", "A clown", "A dentist", "A knight", "A princess", "An astronaut"]
    let actions = ["drawing", "leaping", "skating", "racing go-karts", "flying", "baking a cake", "fleeing villains", "crouching", "yodeling", "playing violin", "performing ballet", "DJing", "shopping", "conducting", "sleuthing", "running track", "swimming", "golfing", "taking photos", "writing books", "building", "climbing", "somersaulting"]
    let settings = ["in Yosemite", "in the Sahara", "underwater", "on Mount Everest", "on Mars", "in the Met", "in midair", "on a cloud", "at Walmart", "in a taxi", "in a castle", "by the beach", "at a concert", "at the White House", "on a rollercoaster", "on a cliff", "on a pirate ship", "in a jungle", "at Starbucks", "at IKEA", "on a sled", "in a cave"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Creating new prompts
    
    @IBAction func getNewPrompt(_ sender: UIButton) {
        
        let randomSubjectIndex = Int(arc4random_uniform(UInt32(subjects.count)))
        let randomSubject = subjects[randomSubjectIndex]
        print (randomSubject)
        if buttonClicked == 0 {
            newSubject.text = randomSubject
        }
        
        let randomActionIndex = Int(arc4random_uniform(UInt32(actions.count)))
        let randomAction = actions[randomActionIndex]
        print (randomAction)
        if buttonClicked == 0 {
            newAction.text = randomAction
        }
        
        let randomSettingIndex = Int(arc4random_uniform(UInt32(settings.count)))
        let randomSetting = settings[randomSettingIndex]
        print (randomSetting)
        if buttonClicked == 0 {
            newSetting.text = randomSetting
        }
        
        buttonClicked += 1
        
    }
    
    // Timer
    
    var seconds = 60
    var timer = Timer()
    var timerOn = false
    var buttonClicked = 0
    
    @IBAction func startTimer(_ sender: UIButton) {
        if !timerOn {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(runTimer)), userInfo: nil, repeats: true)
        }
        timerOn = true
    }
    
    @objc func runTimer() {
        if seconds < 1 {
            timer.invalidate()
            let alertController = UIAlertController(title: "Time's up!", message: "", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            buttonClicked = 0
            timerOn = false
            timerLabel.text = "1:00"
            seconds = 60
        }
        else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutesLeft = Int(time) / 60 % 60
        let secondsLeft = Int(time) % 60
        timerLabel.text = "\(minutesLeft):\(secondsLeft)"
        return String(format: "%02i:%02i", minutesLeft, secondsLeft)
    }
    
}

