//
//  DetailViewModel.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//
import Foundation

class DetailViewModel {
    private let cat: Cat
    private let coreDataManager = CoreDataManager.shared

    var name: String {
        return cat.name ?? ""
    }

    var adaptability: Float {
        return Float(cat.adaptability ?? 0)
    }

    var vocalisation: Float {
        return Float(cat.vocalisation ?? 0)
    }

    var affectionLevel: Float {
        return Float(cat.affectionLevel ?? 0)
    }

    var socialNeeds: Float {
        return Float(cat.socialNeeds ?? 0)
    }

    var sheddingLevel: Float {
        return Float(cat.sheddingLevel ?? 0)
    }

    var rare: Float {
        return Float(cat.rare ?? 0)
    }

    var description: String {
        return cat.description ?? ""
    }

    var imageUrl: String {
        return cat.image?.url ?? ""
    }

    init(cat: Cat) {
        self.cat = cat
    }

    func isFavorite() -> Bool {
        return coreDataManager.isFavorite(cat: cat)
    }

    func saveToFavorites() {
        coreDataManager.saveCat(cat)
    }

    func removeFromFavorites() {
        coreDataManager.removeCat(cat)
    }
}
