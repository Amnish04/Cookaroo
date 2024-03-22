//
//  TimerVC.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-16.
//

import UIKit
import AVFoundation

class TimerVC: UIViewController {

    @IBOutlet weak var recipeNameLabel: UILabel!
    
    // Prep Timer
    @IBOutlet weak var prepTimerLabel: UILabel!
    @IBOutlet weak var prepTimeStepper: UIStepper!
    
    // Cook Timer
    @IBOutlet weak var cookTimerLabel: UILabel!
    @IBOutlet weak var cookTimerStepper: UIStepper!
    
    // Rest Timer
    @IBOutlet weak var restTimerLabel: UILabel!
    @IBOutlet weak var restTimerStepper: UIStepper!
    
    // Timer State
    var prepTimer: Int = 0
    var cookTimer: Int = 0
    var restTimer: Int = 0
    
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Do any additional setup after loading the view.
        let selectedRecipe = DataHandler.getSelectedRecipe()
        recipeNameLabel.text = selectedRecipe.dishName
        
        initTimers()
    }
    
    func initTimers() {
        let selectedRecipe = DataHandler.getSelectedRecipe()
        
        // Prep Timer
        prepTimer = selectedRecipe.prepTime
        prepTimeStepper.value = Double(prepTimer)
        
        // Cook Timer
        cookTimer = selectedRecipe.cookTime
        cookTimerStepper.value = Double(cookTimer)
        
        // Rest Time
        restTimer = selectedRecipe.restTime
        restTimerStepper.value = Double(restTimer)
        
        updateTimerLabels()
    }
    
    func updateTimerLabels() {
        prepTimerLabel.text = String(prepTimer)
        cookTimerLabel.text = String(cookTimer)
        restTimerLabel.text = String(restTimer)
        
        let remainingTime = prepTimer + cookTimer + restTimer
        let totalTime = elapsedTime + remainingTime
        
        let timeFactor = Double(elapsedTime) / Double(totalTime)
        timerProgressView.setProgress(Float(timeFactor), animated: true)
        
    }
    
    
    @IBAction func prepTimerChanged(_ sender: UIStepper) {
        prepTimer = Int(sender.value)
        
        if (prepTimer == 0) {
            prepTimeStepper.isEnabled = false
        }
        
        updateTimerLabels()
    }
    
    @IBAction func cookTimerChanged(_ sender: UIStepper) {
        cookTimer = Int(sender.value)
        
        if (cookTimer == 0) {
            cookTimerStepper.isEnabled = false
        }
        
        updateTimerLabels()
    }
    
    
    @IBAction func restTimerChanged(_ sender: UIStepper) {
        restTimer = Int(sender.value)
        
        if (restTimer == 0) {
            restTimerStepper.isEnabled = false
        }
        
        updateTimerLabels()
    }
    
    // Timer Logic
    
    var elapsedTime = 0
    var timer: Timer? = nil
    
    @IBAction func startTimer(_ sender: Any) {
        if (timer == nil) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.elapsedTime += 1
                self.calculateAndUpdateTimers()
            }
        }
    }
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    func playSound(soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.numberOfLoops = -1 // Set to loop indefinitely
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }

    }
    
    func calculateAndUpdateTimers() {
        let alarmSound: SystemSoundID = 1304
        let endSound: SystemSoundID = 1328
        
        if (prepTimer > 0) {
            prepTimer -= 1
            prepTimeStepper.value = Double(prepTimer)
            
            if prepTimer == 0 {
                prepTimeStepper.isEnabled = false
                // Play Sound
                AudioServicesPlaySystemSound(alarmSound)
            }
            
            updateTimerLabels()
            return
        }
        
        if (cookTimer > 0) {
            if !player.isPlaying {
                playSound(soundName: "SanjiTheme")
            }
            
            cookTimer -= 1
            cookTimerStepper.value = Double(cookTimer)
            
            if cookTimer == 0 {
                cookTimerStepper.isEnabled = false
                // Play Sound
                AudioServicesPlaySystemSound(alarmSound)
            }
            
            updateTimerLabels()
            return
        }
        
        if (restTimer > 0) {
            if player.isPlaying {
                player.stop()
            }
            
            restTimer -= 1
            restTimerStepper.value = Double(restTimer)
            
            if restTimer == 0 {
                restTimerStepper.isEnabled = false
                // Play Sound
                AudioServicesPlaySystemSound(endSound)
                
                stopTimer(true)
            }
            
            updateTimerLabels()
            return
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        prepTimeStepper.isEnabled = true
        cookTimerStepper.isEnabled = true
        restTimerStepper.isEnabled = true
        
        elapsedTime = 0
        
        initTimers()
    }
}
