//
//  PackageImporter.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/08.
//
//

import Foundation

class PackageImporter: ShellRunnable {
    static let unityPath: String = "/Applications/Unity/Unity.app/Contents/MacOS/Unity"
    static let standardAssetDir: String = "/Applications/Unity/Standard Assets"
    
    let settings: Settings
    init(settings: Settings) {
        self.settings = settings
    }
    
    func `import`() {
        let path = FileManager.default.currentDirectoryPath
        var args = [String]()
        args.append(PackageImporter.unityPath)
        args.append("-quit")
        args.append("-batchmode")
        args.append("-projectPath " + path)
        let baseArgs = args.joined(separator: " ")
        
        for standardAsset in self.settings.standardPackages ?? [] {
            let assetPath = PackageImporter.standardAssetDir + "/" + standardAsset.replacingOccurrences(of: " ", with: "\\ ") + ".unitypackage"
            print("import: " + assetPath)
            let _ = shell(path: "/bin/bash", args: ["-c", baseArgs + " -importPackage " + assetPath])
        }
        
        for customAsset in self.settings.customPackages ?? [] {
            let assetPath = customAsset.replacingOccurrences(of: " ", with: "\\ ")
            print("import: " + assetPath)
            let _ = shell(path: "/bin/bash", args: ["-c", baseArgs + " -importPackage " + assetPath])
        }
        
        print("👍 fin import packages")
        
    }
}
