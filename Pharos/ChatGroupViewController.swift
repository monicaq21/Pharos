import UIKit
import Firebase

class ChatGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    var group:Group?
    var chatMessages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none
        chatTableView.allowsSelection = false
        
        sendButton.layer.cornerRadius = 7
        
        title = group?.GroupName
        
        observeMessages()
        
    }
    
    func observeMessages() {
        
        guard let groupID = self.group?.GroupID else {
            return
        }
        
        let ref = Database.database().reference()
        ref.child("groups").child(groupID).child("messages").observe(.childAdded) { (snapshot) in
            
            if let dataArray = snapshot.value as? [String: Any] {
                
                guard let senderName = dataArray["senderName"] as? String, let messageText = dataArray["text"] as? String, let senderID = dataArray["senderID"] as? String else {
                    return
                }
                
                let message = Message.init(messageKey: snapshot.key, senderName: senderName, messageText: messageText, senderID: senderID)
                self.chatMessages.append(message)
                self.chatTableView.reloadData()
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = chatMessages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! chatCell
        cell.setMessageData(message: message)
        if message.senderID != Auth.auth().currentUser?.uid {
            cell.setBubbleType(type: .incoming)
        } else {
            cell.setBubbleType(type: .outgoing)
        }
        
        return cell
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
        
        getUsernameWithID(id: userID) { (userName) in
            if let userName = userName, let senderID = Auth.auth().currentUser?.uid {
                
                let dataArray: [String: Any] = ["senderName": userName, "text": text, "senderID": senderID]
                
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
                self.messageTextField.text = ""
            }
        }
        
    }
    
}
