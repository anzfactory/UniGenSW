//
//  Initializer.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/08.
//
//

import Foundation

/// unigen.jsonを作る
/// すでにある場合は何もしない
class Initializer {
    func run() {
        let settingsController = SettingsJsonController()
        
        let path: String?
        if !settingsController.isExists() {
            path = settingsController.createJson()
        } else {
            path = settingsController.fullPath
        }
        
        if let path = path {
            print("🙆 success! created \(path)")
        } else {
            print("🙅 failed...")
        }
    }
}
