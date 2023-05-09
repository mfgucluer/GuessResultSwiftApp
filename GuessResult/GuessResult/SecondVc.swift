import UIKit
import AVFoundation

class SecondVc: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var nameLabel: UILabel!
    var nameL = ""
    var timeL = 20
    @IBOutlet weak var multiNum1: UILabel!
    @IBOutlet weak var multiNum2: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var rollOut: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var N1: UIImageView!
    @IBOutlet weak var N2: UIImageView!
    @IBOutlet weak var N3: UIImageView!
    @IBOutlet weak var N4: UIImageView!
    @IBOutlet weak var N5: UIImageView!
    @IBOutlet weak var N6: UIImageView!
    @IBOutlet weak var N7: UIImageView!
    
    @IBOutlet weak var guessText: UITextField!
    
    var imageList = [UIImageView]()
    var timer2 = Timer()
    var con = 0
    var DiceNumber = [1,2,3,4,5,6]
    var GlobalRandomDice = 0
    
    var GlrandomMulti1 = 0
    var GlrandomMulti2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageList = [N1,N2,N3,N4,N5,N6,N7]
        nameLabel.text = nameL
        imageList[3].isHidden = true
    }
    
    
    @objc func hideImage2()
    {
        let randomInt = Int.random(in: 0...5)
        if con < 25
        {
            rollOut.isEnabled = false
            con += 1
            if DiceNumber[randomInt]==1{
                for i in 0...6{
                    imageList[i].isHidden = true
                }
                imageList[3].isHidden = false
            }
            if DiceNumber[randomInt]==2{
                for i in 0...6{
                    imageList[i].isHidden = true
                }
                imageList[0].isHidden = false
                imageList[6].isHidden = false
            }
            if DiceNumber[randomInt]==3{
                for i in 0...6{
                    imageList[i].isHidden = true
                }
                imageList[0].isHidden = false
                imageList[6].isHidden = false
                imageList[3].isHidden = false
            }
            if DiceNumber[randomInt]==4{
                for i in 0...6{
                    imageList[i].isHidden = true
                }
                imageList[0].isHidden = false
                imageList[6].isHidden = false
                imageList[2].isHidden = false
                imageList[4].isHidden = false
            }
            if DiceNumber[randomInt]==5{
                for i in 0...6{
                    imageList[i].isHidden = true
                }
                imageList[0].isHidden = false
                imageList[6].isHidden = false
                imageList[2].isHidden = false
                imageList[4].isHidden = false
                imageList[3].isHidden = false
            }
            if DiceNumber[randomInt]==6{
                for i in 0...6{
                    imageList[i].isHidden = true
                }
                imageList[0].isHidden = false
                imageList[6].isHidden = false
                imageList[2].isHidden = false
                imageList[4].isHidden = false
                imageList[5].isHidden = false
                imageList[1].isHidden = false
            }
            GlobalRandomDice = DiceNumber[randomInt]
        }
        else{
            timer2.invalidate()
            con = 0
            
        }
    }
    
    
    
    
    
    @IBAction func rollClicked(_ sender: Any) {
        
        playsound()
        
        let randomMulti1 = Int.random(in: 1...99)
        let randomMulti2 = Int.random(in: 1...99)
        
        GlrandomMulti1 = randomMulti1
        GlrandomMulti2 = randomMulti2
        
        
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(hideImage2), userInfo: nil, repeats: true)
        multiNum1.text = String(GlrandomMulti1)
        multiNum2.text = String(GlrandomMulti2)
        messageLabel.text = "__________________________"
        
    }
    
    

    
    @IBAction func guessClicked(_ sender: Any) {
        
        let realResult = GlrandomMulti1 * GlrandomMulti2
        
        if GlobalRandomDice >= 1 {
            if let guessResult =  Int(guessText.text!)
            {
                if realResult == guessResult{
                    messageLabel.text = "Yes Right Guess!"
                    rollOut.isEnabled = true
                    
                }
                else if realResult > guessResult {
                    
                    GlobalRandomDice -= 1
                    if GlobalRandomDice == 0{
                        messageLabel.text = "You have not right! The Result is:\(realResult)"
                        rollOut.isEnabled = true
                    }
                    else {messageLabel.text = "Less You have \(GlobalRandomDice) right(s)"
                    }
                    
                }
                
                else{
                    
                    
                    GlobalRandomDice -= 1
                    if GlobalRandomDice == 0{
                        messageLabel.text = "You have not right! The Result is:\(realResult)"
                        rollOut.isEnabled = true
                    }
                    else {messageLabel.text = "Much. You have \(GlobalRandomDice) right(s)"}
                }
            }
            else{
                GlobalRandomDice -= 1
                messageLabel.text = "Please Enter Number. You have \(GlobalRandomDice) right(s)"
                
            }
            
        }
        
        
        
    }
    
    func playsound(){
        let url = Bundle.main.url(forResource: "Dice - SOUND EFFECT -", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
        
    }
    

    

}
