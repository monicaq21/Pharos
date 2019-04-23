import UIKit

class ISpyViewController: UIViewController {
    
    @IBOutlet weak var ISpyImage: UIImageView!
    @IBOutlet weak var goalLabel: UILabel!
    
    
    let images = [UIImage(named: "ISpy1.jpg"),UIImage(named: "ISpy2.jpg"),UIImage(named: "ISpy3.jpg"),UIImage(named: "ISpy4.jpg"),UIImage(named: "ISpy5.jpg"),UIImage(named: "ISpy6.jpg"),UIImage(named: "ISpy7.jpg"),UIImage(named: "ISpy8.jpg")]
    let goals = ["Find a keychain", "Find a broomstick", "Find 2 garbage bins", "Find salt and pepper", "Find a tall black stool", "Find the drawing of a vase", "Find 8 light switches", "Find wine bottles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomNumber = Int(arc4random_uniform(UInt32(images.count - 1)))
        
        ISpyImage.image = images[randomNumber]
        goalLabel.text = goals[randomNumber]
        
        
    }

    @IBAction func endButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Congratulations!", message: "You have completed today's challenge.", preferredStyle: UIAlertController.Style.alert)
        let okay = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
        
    }
}
