//
//  Generator.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/09.
//
//

import Foundation

class Generator {
    func generate() {
        let json = SettingsJsonController().readJson()
        if let json = json {
            let settings = Settings(json: json)
            DirectoryGenerator(settings: settings).generate()
            PackageImporter(settings: settings).import()
            
            print("🎉 enjoy unity!")
        }
    }
}
