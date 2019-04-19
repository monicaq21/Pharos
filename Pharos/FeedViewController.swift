import UIKit
import Firebase
import FirebaseDatabase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String]()
    var postCommentArray = [String]()
    var postImageURLArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromServer()
        
    }
    
    func getDataFromServer() {
        
        //observe: select the one with that action (in this case is added)
        //snapshot is the data that we get
        Database.database().reference().child("users").observe(DataEventType.childAdded) { (snapshot) in
            
            //post
            let values = snapshot.value! as! NSDictionary
            
            //each posts
            let post = values["post"] as! NSDictionary
            
            let postIDS = post.allKeys
            
            for id in postIDS {
                
                let singlePost = post[id] as! NSDictionary
                
                self.userEmailArray.append(singlePost["postedby"] as! String)
                self.postCommentArray.append(singlePost["posttext"] as! String)
                self.postImageURLArray.append(singlePost["image"] as! String)
                
            }
            
            self.tableView.reloadData()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        cell.usernameLabel.text = userEmailArray[indexPath.row]
        
        cell.postText.text = postCommentArray[indexPath.row]
        
        cell.postImage.sd_setImage(with: URL(string: self.postImageURLArray[indexPath.row]), completed: nil)
        
        return cell
        
    }

}