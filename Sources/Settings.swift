//
//  Settings.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/09.
//
//

import Foundation

struct Settings {
    
    enum Fields {
        case projectName, standardPackages, customPackages, assets
        
        var key: String {
            switch self {
            case .projectName:
                return "ProjectName"
            case .standardPackages:
                return "StandardPackages"
            case .customPackages:
                return "CustomPackages"
            case .assets:
                return "Assets"
            }
        }
    }
    
    var projectName: String?
    var standardPackages: [String]?
    var customPackages: [String]?
    var assets: [String]?
    
    init(json: Any) {
        guard let json = json as? [String: AnyObject] else {
            return
        }
        
        self.projectName = json[Fields.projectName.key] as? String
        self.standardPackages = json[Fields.standardPackages.key] as? [String]
        self.customPackages = json[Fields.customPackages.key] as? [String]
        if let assets = json[Fields.assets.key] as? [String] {
            self.assets = assets
        }
        
    }
}
