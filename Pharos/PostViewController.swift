import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyDetails: UITextView!
    @IBOutlet weak var shareButton: UIButton!
    
    var uuid = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storyDetails.delegate = self as? UITextViewDelegate
        
        shareButton.layer.borderColor = UIColor.blue.cgColor
        shareButton.layer.borderWidth = 2
        shareButton.layer.cornerRadius = shareButton.frame.height / 2
        
        storyImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(PostViewController.chooseImage))
        storyImage.addGestureRecognizer(recognizer)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func chooseImage() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        storyImage.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func shareClicked(_ sender: Any) {
        
        let imagesFolder = Storage.storage().reference().child("images")
        imagesFolder.downloadURL{ url, error in
            
        }
        
        if let data = storyImage.image?.jpegData(compressionQuality: 0.5) {
            
            //uuid is a randomly generated code
            let mediaImagesRef = imagesFolder.child("\(uuid).jpg")
            mediaImagesRef.putData(data, metadata: nil) { (metadata, error) in
                
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    mediaImagesRef.downloadURL(completion: { (url, error) in
                        if error == nil {
                            
                            let imageURL = url?.absoluteString
                            
                            let databaseReference = Database.database().reference()
                            let userID = Auth.auth().currentUser!.uid
                            databaseReference.child("users").child(userID).child("Name").observeSingleEvent(of: .value, with: { (snapshot) in
                                if let userName = snapshot.value as? String {
                                    
                                    let post = ["image" : imageURL!, "postedby" : userName, "posttext" : self.storyDetails.text!, "uuid" : self.uuid] as [String : Any]
                                    databaseReference.child("users").child((Auth.auth().currentUser?.uid)!).child("post").childByAutoId().setValue(post)
                                    
                                    self.storyImage.image = UIImage(named: "tapMe.png")
                                    self.storyDetails.text = ""
                                    self.navigationController?.popViewController(animated: true)
                                    
                                }
                            })
                            
                            
                            
                        }
                    })
                    
                   
                    
                    
                }
                
            }
            
        }
        
        
    }
    
    
}

