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
            chatSpeechBubble.backgroundColor = #colorLiteral(red: 0.7020623811, green: 1, blue: 0.9508612645, alpha: 1)
            chatTextView.textColor = .black
        } else {
            chatStack.alignment = .trailing
            chatSpeechBubble.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            chatTextView.textColor = .white
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
