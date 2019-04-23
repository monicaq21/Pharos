import UIKit
import AVKit

class YogaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "yogaVideo", ofType: ".mov") {
            
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
                })
            
        }
        
    }

}
