import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player : AVAudioPlayer!
    
    // MARK : - Variable
    var setTime = 0
    var totalTime = 0
    var secondsPass = 0
    
    @IBOutlet weak var labeltitle: UILabel!
    
    // MARK : - Temporizador
    var currentTimer = Timer()
    
    // MARK : - Outlets
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var progressbarSet: UIProgressView!
    
    // MARK : - Metodos
    @IBAction func eggType(_ sender: UIButton) {
        
        currentTimer.invalidate()
        
        let btnTitle = sender.currentTitle
        
        setTime = ( btnTitle! == "Hard") ? 7200 : (btnTitle! == "Medium") ? 4200 : 3000
        totalTime = setTime
        
        progressbarSet.progress = 0.0
        secondsPass = 0
        titulo.text = "How do you like your eggs?"
        
        
        currentTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsPass < totalTime{
            secondsPass+=1
            let progressBarPorcent = Float(secondsPass) / Float(totalTime)
            progressbarSet.progress = Float(progressBarPorcent)
            
        }else{
            
            currentTimer.invalidate()
            titulo.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
    

}
