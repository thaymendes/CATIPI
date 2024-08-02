//
//  API.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

class API {
    static let shared = API()
    private init() {}

    func fetchCats(completion: @escaping (Result<[Cat], APIError>) -> Void) {
        let urlString = EndPoints.getCatsEndpoint()
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.setValue(Config.shared.apiKey, forHTTPHeaderField: "x-api-key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let cats = try decoder.decode([Cat].self, from: data)
                completion(.success(cats))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
