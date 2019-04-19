import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class ChatViewController: UIViewController {

    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatButton.layer.cornerRadius = videoButton.frame.height / 2
        videoButton.layer.cornerRadius = videoButton.frame.height / 2
        
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

