//
//  CoreDataManager.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 30/07/24.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "CatsModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                Logger.shared.log("Failed to load Core Data stack: \(error)", level: .error)
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    func saveCat(_ cat: Cat) {
        let context = persistentContainer.viewContext
        let favoriteCat = FavoriteCat(context: context)
        favoriteCat.id = cat.id
        favoriteCat.name = cat.name
        favoriteCat.adaptability = Int16(cat.adaptability ?? 0)
        favoriteCat.vocalisation = Int16(cat.vocalisation ?? 0)
        favoriteCat.affectionLevel = Int16(cat.affectionLevel ?? 0)
        favoriteCat.socialNeeds = Int16(cat.socialNeeds ?? 0)
        favoriteCat.sheddingLevel = Int16(cat.sheddingLevel ?? 0)
        favoriteCat.rare = Int16(cat.rare ?? 0)
        favoriteCat.catDescription = cat.description
        favoriteCat.imageUrl = cat.image?.url
        saveContext()
        Logger.shared.log("Saved cat: \(cat.name ?? "Unknown")", level: .info)
    }

    func removeCat(_ cat: Cat) {
        Logger.shared.log("removeCat(_:) started for cat: \(cat.name ?? "Unknown")", level: .debug)
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<FavoriteCat> = FavoriteCat.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", cat.id)
        
        do {
            let result = try context.fetch(fetchRequest)
            if let favoriteCat = result.first {
                context.delete(favoriteCat)
                Logger.shared.log("Cat found and deleted: \(cat.name ?? "Unknown")", level: .debug)
                saveContext()
                Logger.shared.log("Context saved after deletion for cat: \(cat.name ?? "Unknown")", level: .debug)
            } else {
                Logger.shared.log("Failed to find cat to remove: \(cat.name ?? "Unknown")", level: .warning)
            }
        } catch {
            Logger.shared.log("Error fetching cat to remove: \(error)", level: .error)
        }
    }



    func isFavorite(cat: Cat) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<FavoriteCat> = FavoriteCat.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", cat.id)
        if let result = try? context.fetch(fetchRequest), result.first != nil {
            return true
        }
        return false
    }

    func fetchAllFavorites() -> [FavoriteCat] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<FavoriteCat> = FavoriteCat.fetchRequest()
        if let result = try? context.fetch(fetchRequest) {
            Logger.shared.log("Fetched \(result.count) favorite cats", level: .debug)
            return result
        }
        Logger.shared.log("Failed to fetch favorite cats", level: .error)
        return []
    }

    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                Logger.shared.log("Core Data context saved", level: .debug)
            } catch {
                Logger.shared.log("Failed to save Core Data context: \(error)", level: .error)
                fatalError("Failed to save Core Data context: \(error)")
            }
        }
    }
}
