//
//  ShellRunable.swift
//  UniGenSW
//
//  Created by shingo asato on 2017/08/08.
//
//

import Foundation

protocol ShellRunnable {

}

extension ShellRunnable {
    func shell(path: String, args: [String]?) -> String? {
        let process = Process()
        process.launchPath = path
        if let args = args {
            process.arguments = args
        }
        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        process.waitUntilExit()
        return String(data: Data(pipe.fileHandleForReading.readDataToEndOfFile()), encoding: .utf8)
    }
}
