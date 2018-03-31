import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()
//Drake - God's Plan (instrumental)
func playMusic() {
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "God's plan", ofType: "mp3")!))
        audioPlayer.prepareToPlay()
        audioPlayer.volume = 0.35
        audioPlayer.play()
    } catch {
        print(error.localizedDescription)
    }
}

func stopMusic() {
    if audioPlayer.volume > 0.1 {
        audioPlayer.volume -= 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            stopMusic()
        })
    } else {
        audioPlayer.stop()
    }
}

