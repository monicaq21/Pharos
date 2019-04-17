import UIKit

class dailyQuotesViewController: UIViewController {

    
    @IBOutlet weak var quoteText: UITextView!
    @IBOutlet weak var speakerLabel: UILabel!
    
    let quotes = ["Wisdom is the reward you get for a lifetime of listening when you'd have preferred to talk.",
                  "Never look down on anybody unless you're helping them up.",
                  "Truth never damages a cause that is just.",
                  "Wherever there is a human being, there is an opportunity for a kindness.",
                  "Listening is being able to be changed by the other person.",
                  "No one has ever become poor by giving.",
                  "Success is stumbling from failure to failure with no loss of enthusiasm.",
                  "The most important thing in communication is hearing what isn't said",
                  "A warm smile is the universal language of kindness.",
                  "Most people do not listen with the intent to understand; they listen with the intent to reply.",
                  "Friends are those rare people who ask how we are, and then wait to hear the answer.",
                  "The art of conversation lies in listening.",
                  "You cannot truly listen to anyone and do anything else at the same time.",
                  "We have two ears and one tongue so that we would listen more and talk less.",
                  "Enlightenment is the key to everything, and it is the key to intimacy, because it is the goal of true authenticity.",
                  "We need to find the courage to say no to the things and people that are not serving us if we want to rediscover ourselves and live our lives with authenticity.",
                  "I know of nothing more valuable, when it comes to the all-important virtue of authenticity, than simply being who you are.",
                  "Reflect upon your present blessings--of which every man has many--not on your past misfortunes, of which all men have some.",
                  "Surprise yourself every day with your own courage.",
                  "We love life, not because we are used to living but because we are used to loving.",
                  "The beautiful journey of today can only begin when we learn to let go of yesterday.",
                  "The only disability in life is a bad attitude.",
                  "True forgiveness is when you can say, 'Thank you for that experience.'",
                  "Live authentically.",
                  "Honesty is the first chapter in the book of wisdom.",
                  "Authenticity requires a certain measure of vulnerability, transparency, and integrity",
                  "Forgiveness does not change the past, but it does enlarge the future",
                  "Life is a succession of lessons which must be lived to be understood.",
                  "There is no persuasiveness more effectual than the transparency of a single heart, of a sincere life.",
                  "One of the most sincere forms of respect is actually listening to what another has to say.",
                  "I can be a better me than anyone can.",
                  ]
                  
    let speakers = ["Doug Larson",
                    "Jesse Jackson",
                    "Mahatma Gandhi",
                    "Lucius Annaeus Seneca",
                    "Alan Alda",
                    "Anne Frank",
                    "Winston Churchill",
                    "Peter Drucker",
                    "William Arthur Ward",
                    "Stephen R. Covey",
                    "Ed Cunningham",
                    "Malcom Forbes",
                    "M. Scott Peck",
                    "Diogenes",
                    "Marianne Willliamson",
                    "Barbara de Angelis",
                    "Charles R. Swindoll",
                    "Charles Dickens",
                    "Denholm Elliott",
                    "Friedrich Nietzsche",
                    "Steve Maraboli",
                    "Scott Hamilton",
                    "Oprah Winfrey",
                    "Steve Maraboli",
                    "Thomas Jefferson",
                    "Janet Louise Stepenson",
                    "Paul Boese",
                    "Helen Keller",
                    "Joseph Barber Lightfoot",
                    "Bryant H. McGill",
                    "Diana Ross",
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        let today = calendar.component(.day, from: date) - 1
        
        quoteText.text = quotes[today]
        speakerLabel.text = "--\(speakers[today])"
        
        
    }
    
    

}
