import UIKit
import Firebase

class ChatGroupViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    var group:Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getUsernameWithID (id: String, completion: @escaping (_ userName: String?) -> ()) {
        let databaseref = Database.database().reference()
        let user = databaseref.child("users").child(id)
        
        user.child("Name").observeSingleEvent(of: .value) { (snapshot) in
            if let userName = snapshot.value as? String {
                completion(userName)
            } else {
                completion(nil)
            }
        }
    }
    
    func sendMessage(text:String, completion: @escaping (_ isSuccess: Bool) -> ()) {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let databaseref = Database.database().reference()
        
        getUsernameWithID(id: Auth.auth().currentUser!.uid) { (userName) in
            if let userName = userName {
                
                let dataArray: [String: Any] = ["senderName": userName, "text": text]
                
                if let groupID = self.group?.GroupID {
                    let group = databaseref.child("groups").child(groupID)
                    group.child("messages").childByAutoId().setValue(dataArray, withCompletionBlock: { (error, ref) in
                        
                        if error == nil {
                            completion(true)
                            self.messageTextField.text = ""
                        } else {
                            completion(false)
                        }
                        
                    })
                }
                
            }
        }
        
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        
        guard let message = messageTextField.text, message.isEmpty == false else {
            return
        }
        
        sendMessage(text: message) { (isSuccess) in
            if isSuccess {
                print("Message sent!")
            }
        }
        
    }
    
}
