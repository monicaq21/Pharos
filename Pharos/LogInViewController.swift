import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInClicked(_ sender: Any) {
        
        if emailText.text != "" && firstNameText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: firstNameText.text!) { (user, error) in
                
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okay = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    UserDefaults.standard.set(self.emailText.text!, forKey: "email")
                    UserDefaults.standard.synchronize()

                    let delegate = UIApplication.shared.delegate as? AppDelegate

                    delegate?.rememberLogin()
                    
                }
                
            }
            
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter your email and first name", preferredStyle: UIAlertController.Style.alert)
            let okay = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && firstNameText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: firstNameText.text!) { (user, error) in
                
                //if there is an error:
                //(localized description: describe the specific problem of the error)
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okay = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    UserDefaults.standard.set(self.emailText.text!, forKey: "email")
                    UserDefaults.standard.synchronize()

                    let delegate = UIApplication.shared.delegate as? AppDelegate

                    delegate?.rememberLogin()
                    
                }
                
                
            }
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter your email and first name", preferredStyle: UIAlertController.Style.alert)
            let okay = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
}
