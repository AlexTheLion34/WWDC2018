// Aleksey Petrenko

import UIKit
import PlaygroundSupport

let window = UIWindow(frame: Design.playgroundRect)

window.rootViewController = FirstViewController()
window.makeKeyAndVisible()

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = window

//need to add a few more extensions to uiview
//need to create fonts constans
