import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    var helpingStoryboard: String?
    @IBOutlet weak var helpTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.layer.cornerRadius = backBtn.frame.size.height / 2
        
        helpTextView.text = "If you are a first time user: \n  Type your email into the top white box, type a password into the middle white box, and type your first and last name into the bottom white box. Then click on the button that says 'Sign up', and -- Tada! You have created your own account! \n \nIf you already have an account: \n  Type your email into the top white box and type a password into the middle white box. You don't need to fill in the bottom white box. Clicked on the button that says 'Log in' to get into your account!"
    }

    @IBAction func backBtnClicked(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
