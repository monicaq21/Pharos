import UIKit
import Firebase

class ChatGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var groupsTable: UITableView!
    @IBOutlet weak var newGroupTextField: UITextField!
    
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.groupsTable.delegate = self
        self.groupsTable.dataSource = self
        
        observeGroups()
        
    }
    
    func observeGroups() {
        
        let databaseref = Database.database().reference()
        databaseref.child("groups").observe(DataEventType.childAdded) { (snapshot) in
            if let dataArray = snapshot.value as? [String: Any] {
                if let groupName = dataArray["groupName"] as? String {
                    let group = Group.init(GroupName: groupName, GroupID: snapshot.key)
                    self.groups.append(group)
                    self.groupsTable.reloadData()
                }
            }
        }
        
    }
    
    @IBAction func createGroupClicked(_ sender: UIButton) {
        
        guard let groupName = newGroupTextField.text, groupName.isEmpty == false else {
            return
        }
        
        let databaseRef = Database.database().reference()
        let group = databaseRef.child("groups").childByAutoId()
        let dataArray:[String: Any] = ["groupName": groupName]
        group.setValue(dataArray) { (error, ref) in
            if error == nil {
                self.newGroupTextField.text = ""
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedGroup = self.groups[indexPath.row]
        
        let chatGroupVC = self.storyboard?.instantiateViewController(withIdentifier: "chatGroup") as! ChatGroupViewController
        self.navigationController?.pushViewController(chatGroupVC, animated: true)
        
        chatGroupVC.group = selectedGroup
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell")!
        cell.textLabel?.text = groups[indexPath.row].GroupName
        return cell

    }

}
