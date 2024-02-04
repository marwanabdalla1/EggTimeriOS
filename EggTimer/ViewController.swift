//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var mainText: UILabel!
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    let eggTimes = ["Soft":3, "Medium": 5, "Hard":7]
    
    var timer = Timer()
    var remainingSeconds = 60
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
       
        
        
        totalTime = eggTimes[hardness]!


        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
         if(secondsPassed < totalTime) {
             secondsPassed+=1
             progressBar.progress = Float (secondsPassed)/Float (totalTime)
         }
        else {
            timer.invalidate()
            mainText.text="Done!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
     
 }
    
}
