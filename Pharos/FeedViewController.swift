import UIKit
import Firebase
import FirebaseDatabase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var userNameArray = [String]()
    var postCommentArray = [String]()
    var postImageURLArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        
        let backgroundImage = UIImage(named: "marble.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        getDataFromServer()
        
    }
    
    func getDataFromServer() {
        
        //observe: select the one with that action (in this case is added)
        //snapshot is the data that we get
        Database.database().reference().child("users").observe(DataEventType.childAdded) { (snapshot) in
            
            //post
            let values = snapshot.value! as! NSDictionary
            
            //each posts
            if let post = values["post"] as? NSDictionary {
            
                let postIDS = post.allKeys
            
                for id in postIDS {
                
                    let singlePost = post[id] as! NSDictionary
                
                    self.userNameArray.append(singlePost["postedby"] as! String)
                    self.postCommentArray.append(singlePost["posttext"] as! String)
                    self.postImageURLArray.append(singlePost["image"] as! String)
                
                }
            
            self.tableView.reloadData()
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        cell.usernameLabel.text = userNameArray[indexPath.row]
        cell.postText.text = postCommentArray[indexPath.row]
        cell.postImage.sd_setImage(with: URL(string: self.postImageURLArray[indexPath.row]), completed: nil)
        
        cell.postText.isUserInteractionEnabled = false
        
        return cell
        
    }

}
