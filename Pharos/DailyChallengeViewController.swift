import UIKit

class DailyChallengeViewController: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    
    let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let gameSegues = ["toSundayGame", "toMondayGame", "toTuesdayGame", "toWednesdayGame", "toThursdayGame", "toFridayGame", "toSaturdayGame"]
    
    var today: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        today = calendar.component(.weekday, from: date) - 1
        
        todayLabel.text = daysOfWeek[today]
        
    }
    
    @IBAction func gameClicked(_ sender: Any) {
        
        performSegue(withIdentifier: gameSegues[today], sender: self)
        
    }
    
    @IBAction func quoteClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toQuote", sender: self)
        
    }
    
    @IBAction func jokeClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toJoke", sender: self)
        
    }
    
    @IBAction func riddleClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toRiddle", sender: self)
        
    }
    
    
    
    
}
