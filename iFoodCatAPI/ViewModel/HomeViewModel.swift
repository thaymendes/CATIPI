//
//  HomeViewModel.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

class HomeViewModel {
    private var cats: [Cat] = []

    func fetchCats(completion: @escaping () -> Void) {
        API.shared.fetchCats { [weak self] result in
            switch result {
            case .success(let cats):
                self?.cats = cats
                completion()
            case .failure(let error):
                print("Error fetching cats: \(error)")
                completion()
            }
        }
    }

    func numberOfRows() -> Int {
        return cats.count
    }

    func cat(at index: Int) -> Cat {
        return cats[index]
    }
}
