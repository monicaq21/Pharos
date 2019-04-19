//
//  ViewController.swift
//  Pop the Balloon
//
//  Created by 이수진 on 2019-04-14.
//  Copyright © 2019 이수진. All rights reserved.
//

import UIKit

class PopTheBalloonViewController: UIViewController {
    
    
    @IBOutlet weak var balloon1: UIImageView!
    @IBOutlet weak var balloon2: UIImageView!
    @IBOutlet weak var balloon3: UIImageView!
    @IBOutlet weak var balloon4: UIImageView!
    @IBOutlet weak var balloon5: UIImageView!
    @IBOutlet weak var balloon6: UIImageView!
    @IBOutlet weak var balloon7: UIImageView!
    @IBOutlet weak var balloon8: UIImageView!
    @IBOutlet weak var balloon9: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var HighscoreLabel: UILabel!
    
    var score  = 0
    var counter = 0
    var timer = Timer()
    var hidingBall = Timer()
    var balloonArray = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Highscores
        let Highscore = UserDefaults.standard.object(forKey: "Highscore")
        if Highscore == nil {
            HighscoreLabel.text = "0"
        }
        if let newScore = Highscore as? Int {
            HighscoreLabel.text = String(newScore)
        }
        
        scoreLabel.text = "Score: \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(PopTheBalloonViewController.increaseScores))

        balloon1.addGestureRecognizer(recognizer1)
        balloon2.addGestureRecognizer(recognizer2)
        balloon3.addGestureRecognizer(recognizer3)
        balloon4.addGestureRecognizer(recognizer4)
        balloon5.addGestureRecognizer(recognizer5)
        balloon6.addGestureRecognizer(recognizer6)
        balloon7.addGestureRecognizer(recognizer7)
        balloon8.addGestureRecognizer(recognizer8)
        balloon9.addGestureRecognizer(recognizer9)
        
        balloon1.isUserInteractionEnabled = true
        balloon2.isUserInteractionEnabled = true
        balloon3.isUserInteractionEnabled = true
        balloon4.isUserInteractionEnabled = true
        balloon5.isUserInteractionEnabled = true
        balloon6.isUserInteractionEnabled = true
        balloon7.isUserInteractionEnabled = true
        balloon8.isUserInteractionEnabled = true
        balloon9.isUserInteractionEnabled = true
        
        
        //timer
        counter = 30
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PopTheBalloonViewController.countDown), userInfo: nil, repeats: true)
        
        hidingBall = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(PopTheBalloonViewController.hideBalloon), userInfo: nil, repeats: true)
        
        //
        balloonArray.append(balloon1)
        balloonArray.append(balloon2)
        balloonArray.append(balloon3)
        balloonArray.append(balloon4)
        balloonArray.append(balloon5)
        balloonArray.append(balloon6)
        balloonArray.append(balloon7)
        balloonArray.append(balloon8)
        balloonArray.append(balloon9)

        hideBalloon()
    }
    
    @objc func increaseScores() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        
        counter = counter - 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hidingBall.invalidate()
            
            //checking Highscores
            if self.score > Int(HighscoreLabel.text!)! {
                UserDefaults.standard.set(self.score, forKey: "Highscore")
                HighscoreLabel.text = String(self.score)
            }
            
            
            //creating alert
            let alert = UIAlertController(title: "Time", message: "Your TIme Is Up" , preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(ok)
            
            let replay = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default, handler: {(UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PopTheBalloonViewController.countDown), userInfo: nil, repeats: true)
                
                self.hidingBall = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(PopTheBalloonViewController.hideBalloon), userInfo: nil, repeats: true)
            })
            
            alert.addAction(replay)
            
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func hideBalloon() {
        
        for balloon in balloonArray {
            balloon.isHidden = true
        }
        
        let randomNumber = Int(arc4random_uniform(UInt32(balloonArray.count - 1)))
        balloonArray[randomNumber].isHidden = false
        
    }
}

