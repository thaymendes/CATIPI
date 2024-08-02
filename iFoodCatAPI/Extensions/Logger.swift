//
//  Logger.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 31/07/24.
//

import Foundation

enum LogLevel: String {
    case error = "❌ ERROR"
    case warning = "⚠️ WARNING"
    case info = "ℹ️ INFO"
    case debug = "🐞 DEBUG"
}

class Logger {
    static let shared = Logger()

    private init() {}

    func log(_ message: String, level: LogLevel, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = (file as NSString).lastPathComponent
        let logMessage = "\(Date()) [\(level.rawValue)] [\(fileName):\(line)] \(function) -> \(message)"
        print(logMessage)
    }
}
