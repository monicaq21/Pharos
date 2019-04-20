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
        communityButton.layer.cornerRadius = 7
        
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

