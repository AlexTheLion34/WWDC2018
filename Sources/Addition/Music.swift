import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

func playMusic() {
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "God's plan", ofType: "mp3")!))
        audioPlayer.prepareToPlay()
        audioPlayer.volume = 0.25
        audioPlayer.play()
    } catch {
        print(error.localizedDescription)
    }
}



