import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyDetails: UITextView!
    
    var uuid = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(PostViewController.chooseImage))
        storyImage.addGestureRecognizer(recognizer)
        
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
            imagesFolder.child("\(uuid)").putData(data, metadata: nil) { (metadata, error) in
                
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    let imageURL = metadata?.storageReference?.downloadURL(completion: { (metadata, error) in
                        
                        if let error = error {
                            
                            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(ok)
                            self.present(alert, animated: true, completion: nil)
                            
                        } else {
                            
                        }
                        
                    })
                    
                    
                    
                    
                }
                
            }
            
        }
        
        
    }
    
    
}

