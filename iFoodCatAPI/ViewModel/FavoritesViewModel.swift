//
//  FavoritesViewModel.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

class FavoritesViewModel {
    
    private var favoriteCats: [FavoriteCat] = []
    private let repository = CoreDataRepository.shared

    init() {
        fetchFavoriteCats()
    }
    
    func numberOfRows() -> Int {
        return favoriteCats.count
    }
    
    func cat(at index: Int) -> FavoriteCat {
        return favoriteCats[index]
    }
    
    func addFavorite(cat: Cat) {
        repository.saveFavoriteCat(cat: cat)
        fetchFavoriteCats()
    }
    
    func removeFavorite(at index: Int) {
        let catId = favoriteCats[index].id ?? ""
        repository.deleteFavoriteCat(byId: catId)
        fetchFavoriteCats()
    }
    
    private func fetchFavoriteCats() {
        favoriteCats = repository.fetchFavoriteCats()
    }
}

