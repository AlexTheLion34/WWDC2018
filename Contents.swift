//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 300, height: 500))

window.rootViewController = FirstViewController()
window.makeKeyAndVisible()

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = window
