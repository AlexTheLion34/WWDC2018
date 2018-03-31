// Aleksey Petrenko
//All the icons are taken from free desktop Mac App - Icons8
//1148 lines
import UIKit
import PlaygroundSupport

let window = UIWindow(frame: Design.playgroundRect)

window.rootViewController = FirstViewController()
window.makeKeyAndVisible()

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = window


