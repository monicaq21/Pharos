import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailText.delegate = self as? UITextFieldDelegate
        self.passwordText.delegate = self as? UITextFieldDelegate
        
        logInButton.layer.cornerRadius = logInButton.frame.height / 2
        logInButton.layer.shadowColor = UIColor.white.cgColor
        logInButton.layer.shadowRadius = 5
        logInButton.layer.shadowOpacity = 0.5
        logInButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        signUpButton.layer.cornerRadius = logInButton.frame.height / 2
        signUpButton.layer.shadowColor = UIColor.white.cgColor
        signUpButton.layer.shadowRadius = 5
        signUpButton.layer.shadowOpacity = 0.5
        signUpButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func logInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
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
        
        if emailText.text != "" && passwordText.text != "" && nameText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
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
                    
                    let ref = Database.database().reference()
                    let userID = Auth.auth().currentUser!.uid
                    ref.child("users").child(userID).child("Name").setValue(self.nameText.text)
                    
                    
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
