//
//  SettingsJsonController.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/09.
//
//

import Foundation

struct SettingsJsonController {
    static let defaultFileName: String = "unigen.json"
    
    var fileName: String = ""
    init(fileName: String = defaultFileName) {
        self.fileName = fileName
    }
    
    var fullPath: String {
        return FileManager.default.currentDirectoryPath + "/" + self.fileName
    }
    
    func isExists() -> Bool {
        return FileManager.default.fileExists(atPath: self.fullPath)
    }
    
    func createJson() -> String? {
        let initJson: [String: Any] = [
            "ProjectName": "YourProjectName",
            "Assets": [
                "Scripts",
                "Resources"
            ],
            "StandardPackages": [String](),
            "CustomPackages": [String]()
        ]
        let jsonObject: Data
        do {
            jsonObject = try JSONSerialization.data(withJSONObject: initJson, options: [.prettyPrinted])
        } catch (let e) {
            print("🙅 \(e)")
            return nil
        }
        
        let path = self.fullPath
        FileManager.default.createFile(atPath: path, contents: jsonObject, attributes: nil)
        
        return path
    }
    
    func readJson() -> Any? {
        let fileUrl = URL(fileURLWithPath: self.fullPath)
        let jsonObject: Data
        do {
            jsonObject = try Data(contentsOf: fileUrl)
        } catch (let e) {
            print("🙅 \(e)")
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: jsonObject, options: [])
        } catch (let e) {
            print("🙅 \(e)")
            return nil
        }
        
    }
    
}
