import UIKit

func readFromFile(withName name: String) -> (String) {
    var content = ""
    let fileURL = Bundle.main.url(forResource: name, withExtension: "txt")
    do {
        content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    } catch {
        print(error.localizedDescription)
    }
    
    return content
}

