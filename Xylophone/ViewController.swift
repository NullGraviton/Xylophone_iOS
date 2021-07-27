import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        playSound(soundName: sender.currentTitle!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
    func playSound(soundName : String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            //You can make workaround for error.
            print(error)
        }
    }
}


