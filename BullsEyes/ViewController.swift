//
//  ViewController.swift
//  BullsEyes
//
//  Created by Le Trung on 4/19/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    
    var roundValue: Int = 1
    
    var score: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    
    var targetValue: Int = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startOver()
		
		let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
		slider.setThumbImage(thumbImageNormal, for: .normal)
		
		let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
		slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
		
		let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
		
		let trackLeftImage = UIImage(named: "SliderTrackLeft")
		let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
		slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
		
		let trackRightImage = UIImage(named: "SliderTrackRight")
		let trackRightResizeable = trackRightImage?.resizableImage(withCapInsets: insets)
		slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
        
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue )
        roundValue += 1
        updateLabel()
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue)
        roundLabel.text = String(roundValue)
        scoreLabel.text = String(score)
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        
        var points = 100 - difference
        
        let title : String
        
        if difference == 0 {
            title = "Perfect"
            points += 100
        }
        else if difference < 5 {
            title = "You almost had it"
            if difference == 1{
                points += 15
            }
        }
        else if difference < 10 {
            title = "Pretty close"
        }
        else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "Your score is: \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Back to main screen", style: .default, handler: {
            action in
                self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
	
    }
    
    @IBAction func startOver() {
        score = 0
        roundValue = 0
        startNewRound()
        
    }
}

