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
        
        chatButton.layer.cornerRadius = 7
        chatButton.layer.shadowColor = UIColor.red.cgColor
        chatButton.layer.shadowRadius = 10
        chatButton.layer.shadowOpacity = 1
        chatButton.layer.shadowOffset = CGSize(width: -10, height: 10)
        
        videoButton.layer.cornerRadius = 7
        videoButton.layer.shadowColor = UIColor.blue.cgColor
        videoButton.layer.shadowRadius = 10
        videoButton.layer.shadowOpacity = 1
        videoButton.layer.shadowOffset = CGSize(width: -10, height: 10)
        
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

