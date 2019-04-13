import UIKit

//change the hole into the drawing
//different versions sizing problems

class whackAMoleViewController: UIViewController {
    
    @IBOutlet weak var pos1: UIImageView!
    @IBOutlet weak var pos2: UIImageView!
    @IBOutlet weak var pos3: UIImageView!
    @IBOutlet weak var pos4: UIImageView!
    @IBOutlet weak var pos5: UIImageView!
    @IBOutlet weak var pos6: UIImageView!
    @IBOutlet weak var pos7: UIImageView!
    @IBOutlet weak var pos8: UIImageView!
    @IBOutlet weak var pos9: UIImageView!
    
    var images = [UIImageView]()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var score = 0
    var time = 20
    var highScore = 0
    var prevPos = -1
    var timer = Timer()
    var moleTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storedScore = UserDefaults.standard.object(forKey: "highScore") as? Int {
            highScore = storedScore
        } else {
            highScore = 0
        }
        
        highScoreLabel.text = "High Score: \(highScore)"
        
        images.append(pos1)
        images.append(pos2)
        images.append(pos3)
        images.append(pos4)
        images.append(pos5)
        images.append(pos6)
        images.append(pos7)
        images.append(pos8)
        images.append(pos9)
        
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        
        score = 0
        time = 20
        
        scoreLabel.text = "Score: \(score)"
        timeLabel.text = "Time left: \(time)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(whackAMoleViewController.countDown), userInfo: nil, repeats: true)
        
        moleTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(whackAMoleViewController.molesAppear), userInfo: nil, repeats: true)
        
        pos1.isUserInteractionEnabled = true
        pos2.isUserInteractionEnabled = true
        pos3.isUserInteractionEnabled = true
        pos4.isUserInteractionEnabled = true
        pos5.isUserInteractionEnabled = true
        pos6.isUserInteractionEnabled = true
        pos7.isUserInteractionEnabled = true
        pos8.isUserInteractionEnabled = true
        pos9.isUserInteractionEnabled = true
        
        let catchMole1 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole2 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole3 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole4 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole5 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole6 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole7 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole8 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        let catchMole9 = UITapGestureRecognizer(target: self, action: #selector(whackAMoleViewController.addScore))
        
        pos1.addGestureRecognizer(catchMole1)
        pos2.addGestureRecognizer(catchMole2)
        pos3.addGestureRecognizer(catchMole3)
        pos4.addGestureRecognizer(catchMole4)
        pos5.addGestureRecognizer(catchMole5)
        pos6.addGestureRecognizer(catchMole6)
        pos7.addGestureRecognizer(catchMole7)
        pos8.addGestureRecognizer(catchMole8)
        pos9.addGestureRecognizer(catchMole9)
        
    }
    
    @objc func addScore () {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown () {
        time -= 1
        timeLabel.text = "Time left: \(time)"
        
        if time == 0 {
            
            timer.invalidate()
            moleTimer.invalidate()
            
            pos1.isUserInteractionEnabled = false
            pos2.isUserInteractionEnabled = false
            pos3.isUserInteractionEnabled = false
            pos4.isUserInteractionEnabled = false
            pos5.isUserInteractionEnabled = false
            pos6.isUserInteractionEnabled = false
            pos7.isUserInteractionEnabled = false
            pos8.isUserInteractionEnabled = false
            pos9.isUserInteractionEnabled = false
            
            if score > highScore {
                highScore = score
                highScoreLabel.text = "High Score: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
            
            let alert = UIAlertController(title: "Time's Up", message: "Good job! You have scored \(score) points. Press 'Start Game' to play again.", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @objc func molesAppear () {
        
        for kenny in images {
            kenny.isHidden = true
        }
        
        var random = Int(arc4random_uniform(UInt32(8)))
        
        while (random == prevPos) {
            random = Int(arc4random_uniform(UInt32(8)))
        }
        
        images[random].isHidden = false
        prevPos = random
        
    }
    
    
}

