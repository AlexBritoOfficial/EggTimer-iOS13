//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var screenTitle: UILabel!
    
    let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720]
    
    var totalTime = 0         // total countdown duration (fixed)
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.0
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!  // total duration for selected hardness
        secondsPassed = 0                // reset counter
        
        progressView.progress = 0.0      // reset progress bar
        
        screenTitle.text = hardness      // show which hardness selected
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
        
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            print("\(secondsPassed) seconds passed")
            progressView.progress = Float(secondsPassed) / Float(totalTime)
        }
        else {
            timer.invalidate()
            screenTitle.text = "DONE!"
            progressView.progress = 1.0
        }
    }
}
