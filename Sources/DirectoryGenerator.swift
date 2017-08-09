//
//  DirectoryGenerator.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/08.
//
//

import Foundation

class DirectoryGenerator {
    
    let settings: Settings
    init(settings: Settings) {
        self.settings = settings
    }
    
    func generate() {
        
        let manager = FileManager.default
        let directoryPath = manager.currentDirectoryPath + "/" + Settings.Fields.assets.key
        if !manager.fileExists(atPath: directoryPath) {
            print("🙅 not found `Assets` directory")
            return
        }
        
        for asset in self.settings.assets ?? [] {
            let dir = directoryPath + "/" + asset
            if !manager.fileExists(atPath: dir) {
                do {
                    try manager.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
                    print("created " + dir)
                } catch (let e) {
                    print("error \(e)")
                }
            }
        }
        
        print("👍 fin directory generate.")
    }
}
