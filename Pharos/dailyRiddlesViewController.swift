import UIKit

class dailyRiddlesViewController: UIViewController {

    @IBOutlet weak var riddleText: UITextView!
    @IBOutlet weak var AnswerLabel: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    
    let riddleQuestions = ["You find me in December, but not in any other month. What am I?",
                           "What five-letter word becomes shorter if you add two letters to it?",
                           "Why is an island like the letter T?",
                           "I have a neck, but no head, and I wear a cap. What am I?",
                           "What’s the difference between a jeweler and a prison guard?",
                           "I’m an odd number. If you take away one of the letters in my name, I become even. What number am I?",
                           "What has one head, one foot, and four legs?",
                           "What has 13 hearts, but no other organs?",
                           "What do you break before you use it?",
                           "Which is the most curious letter?",
                           "What word begins and ends with an E, but only has one letter?",
                           "What is easy to get into, but hard to get out of?",
                           "What loses its head in the morning and gets it back at night?",
                           "What can you catch but not throw?",
                           "What is brown and sticky?",
                           "What stays where it is when it goes off?",
                           "I'm heavy but not backwards. What am I?",
                           "What belongs to you but others use it more than you do?",
                           "What is so delicate that even mentioning it breaks it?",
                           "You are my brother, but I am not your brother. Who am I?",
                           "What kind of coat can only be put on when wet?",
                           "What kind of tree is carried in your hand?",
                           "I have Eighty-eight keys but cannot open a single door. What am I?",
                           "What number do you get when you multiply all of the numbers on a telephone's number pad?",
                           "What runs around the house but doesn't move?",
                           "You use a knife to slice my head and weep beside me when I am dead. What am I?",
                           "Which word does not belong in the following list: Stop cop mop chop prop shop or crop?",
                           "When do you go at red, but stop at green?",
                           "What time is it when an elephant sits on your fence?",
                           "The more you work, the more I'll eat.You keep me full, I'll keep you neat. What am I?",
                           "What starts with 'P' and ends with 'E' and has more than 1000 letters?"
                           ]
    
    let riddleAnswers = ["The letter D!",
                         "Short (add +'er')!",
                         "They’re both in the middle of water!",
                         "A bottle!",
                         "A jeweler sells watches, and a prison guard watches cells!",
                         "Seven. (Take away the S!)",
                         "A bed.",
                         "A deck of playing cards.",
                         "An egg!",
                         "Y?",
                         "Envelope!",
                         "Trouble.",
                         "A pillow!",
                         "A cold.",
                         "A stick!",
                         "An alarm clock.",
                         "The word 'ton', spelled backwards it is 'not'.",
                         "Your name.",
                         "Silence.",
                         "I am your sister.",
                         "A coat of paint.",
                         "A palm.",
                         "A piano.",
                         "0",
                         "A fence.",
                         "An onion!",
                         "The word 'or' - it doesn't end with 'op'!",
                         "When you are eating a watermelon.",
                         "Time to buy a new fence!",
                         "Pencil sharpener.",
                         "A post office!"
                         ]
    
    let date = Date()
    let calendar = Calendar.current
    var today: Int = 0
    var answerHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        today = calendar.component(.day, from: date) - 1
        
        riddleText.text = riddleQuestions[today]
        answerButton.layer.cornerRadius = 20
        AnswerLabel.text = ""

    }
    
    @IBAction func answerButtonClicked(_ sender: Any) {
        
        if answerHidden {
            answerButton.setTitle("Hide Answer", for: UIControl.State.normal)
            AnswerLabel.text = riddleAnswers[today]
            answerHidden = false
        } else {
            answerButton.setTitle("Show Answer", for: UIControl.State.normal)
            AnswerLabel.text = ""
            answerHidden = true
        }
        
        
    }
    
}
