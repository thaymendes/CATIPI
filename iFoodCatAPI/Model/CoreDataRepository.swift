//
//  CoreDataRepository.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 30/07/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataRepository {
    static let shared = CoreDataRepository()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveFavoriteCat(cat: Cat) {
        let favoriteCat = FavoriteCat(context: context)
        favoriteCat.id = cat.id
        favoriteCat.name = cat.name
        favoriteCat.imageUrl = cat.image?.url
        favoriteCat.adaptability = Int16(cat.adaptability ?? 0)
        favoriteCat.vocalisation = Int16(cat.vocalisation ?? 0)
        favoriteCat.affectionLevel = Int16(cat.affectionLevel ?? 0)
        favoriteCat.socialNeeds = Int16(cat.socialNeeds ?? 0)
        favoriteCat.sheddingLevel = Int16(cat.sheddingLevel ?? 0)
        favoriteCat.rare = Int16(cat.rare ?? 0)
        favoriteCat.catDescription = cat.description

        saveContext()
    }

    func fetchFavoriteCats() -> [FavoriteCat] {
        let request: NSFetchRequest<FavoriteCat> = FavoriteCat.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch favorite cats: \(error)")
            return []
        }
    }

    func deleteFavoriteCat(byId id: String) {
        let request: NSFetchRequest<FavoriteCat> = FavoriteCat.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do {
            if let cat = try context.fetch(request).first {
                context.delete(cat)
                saveContext()
            }
        } catch {
            print("Failed to delete favorite cat: \(error)")
        }
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
