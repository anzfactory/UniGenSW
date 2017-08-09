
//https://docs.unity3d.com/ja/540/Manual/CommandLineArguments.html
import Foundation
import Commander

let main = Group {
    $0.command("init") {
        let initializer = Initializer()
        initializer.run()
    }
    
    $0.command("gen") {
        let generator = Generator()
        generator.generate()
    }
}
main.run()
