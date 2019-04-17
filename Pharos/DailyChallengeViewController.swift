import UIKit

class DailyChallengeViewController: UIViewController {
    
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let gameSegues = ["toMondayGame", "toTuesdayGame", "toWednesdayGame", "toThursdayGame", "toFridayGame", "toSaturdayGame", "toSundayGame"]
    
    var today: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let dateComponents = NSDateComponents()
//        dateComponents.day = 4
//        dateComponents.month = 12
//        dateComponents.year = 2019
//
//        if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
//            let date = gregorianCalendar.date(from: dateComponents as DateComponents) {
//
//            weekday = gregorianCalendar.component(.weekday, from: date)
//
//            //friday is 4
//
//        }
        
        let date = Date()
        let calendar = Calendar.current
        today = calendar.component(.weekday, from: date)
        
    }
    
    @IBAction func gameClicked(_ sender: Any) {
        
        performSegue(withIdentifier: gameSegues[today - 1], sender: self)
        
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
