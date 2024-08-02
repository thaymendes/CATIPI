//
//  BestCatsView.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

class BestCatsViewModel {
    private let api: API
    private var cats: [Cat] = []
    var filteredCats: [Cat] = []

    var onUpdate: (() -> Void)?

    init(api: API = .shared) {
        self.api = api
    }

    func fetchBestCats() {
        api.fetchCats { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let cats):
                self.cats = cats
                self.filteredCats = cats.filter { $0.isBest ?? false }
                self.onUpdate?()
            case .failure(let error):
                print("Error fetching cats: \(error)")
            }
        }
    }
}

