//
//  Config.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

class Config {
    static let shared = Config()
    
    var apiKey: String
    
    private init() {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
              let apiKey = plist["APIKey"] as? String else {
            fatalError("Unable to load configuration")
        }
        
        self.apiKey = apiKey
    }
}
