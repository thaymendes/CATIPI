//
//  APIError.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError(Error)
}
