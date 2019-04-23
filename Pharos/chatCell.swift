import UIKit

class chatCell: UITableViewCell {
    
    enum bubbleType {
        case incoming
        case outgoing
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var chatStack: UIStackView!
    @IBOutlet weak var chatSpeechBubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatSpeechBubble.layer.cornerRadius = 7
    }
    
    func setMessageData (message: Message) {
        
        userNameLabel.text = message.senderName
        chatTextView.text = message.messageText
        
    }
    
    func setBubbleType (type: bubbleType) {
        if type == .incoming {
            chatStack.alignment = .leading
            chatSpeechBubble.backgroundColor = #colorLiteral(red: 0.8836311263, green: 1, blue: 0.9600120889, alpha: 1)
            chatTextView.textColor = .black
        } else {
            chatStack.alignment = .trailing
            chatSpeechBubble.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            chatTextView.textColor = .white
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
