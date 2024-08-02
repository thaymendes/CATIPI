//
//  EndPoints.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

struct EndPoints {
    static let baseUrl = "https://api.thecatapi.com/v1"
    
    static func getCatsEndpoint() -> String {
        return "\(baseUrl)/breeds"
    }
}
