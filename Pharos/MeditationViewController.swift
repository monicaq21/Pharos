import UIKit
import AVFoundation


class MeditationViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let audioPath = Bundle.main.path(forResource: "meditation", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        } catch {
            
        }
        
        
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func replay(_ sender: Any) {
        player.currentTime = 0
    }
    
}
