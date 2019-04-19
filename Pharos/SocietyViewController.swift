import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SocietyViewController: UIViewController {

    @IBOutlet weak var challengeButton: UIButton!
    @IBOutlet weak var communityButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        challengeButton.layer.cornerRadius = 7
        challengeButton.layer.shadowColor = UIColor.blue.cgColor
        challengeButton.layer.shadowRadius = 10
        challengeButton.layer.shadowOpacity = 1
        challengeButton.layer.shadowOffset = CGSize(width: -10, height: 10)
        
        communityButton.layer.cornerRadius = 7
        communityButton.layer.shadowColor = UIColor.blue.cgColor
        communityButton.layer.shadowRadius = 10
        communityButton.layer.shadowOpacity = 1
        communityButton.layer.shadowOffset = CGSize(width: -10, height: 10)
        
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.synchronize()
        
        let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logIn") as? LogInViewController
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = logIn
        
        delegate.rememberLogin()
        
    }
    


}

