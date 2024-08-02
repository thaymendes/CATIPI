//
//  CoreDataManagerTests.swift
//  iFoodCatAPITests
//
//  Created by Thayanne Mendes on 31/07/24.
//

import XCTest
@testable import iFoodCatAPI
import CoreData

class CoreDataManagerTests: XCTestCase {
    
    var coreDataManager: CoreDataManager!

    override func setUpWithError() throws {
           Logger.shared.log("setUpWithError() -> CoreDataManagerTests setUp", level: .debug)
           coreDataManager = CoreDataManager.shared
           clearDatabase()
       }

       override func tearDownWithError() throws {
           Logger.shared.log("tearDownWithError() -> CoreDataManagerTests tearDown", level: .debug)
           clearDatabase()
           coreDataManager = nil
       }

       private func clearDatabase() {
           let context = coreDataManager.persistentContainer.viewContext
           let fetchRequest: NSFetchRequest<NSFetchRequestResult> = FavoriteCat.fetchRequest()
           let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

           do {
               try context.execute(deleteRequest)
               try context.save()
               Logger.shared.log("Database cleared", level: .debug)
           } catch {
               Logger.shared.log("Failed to clear database: \(error)", level: .error)
           }
       }
    
    func testSaveCat() throws {
        let cat = Cat(id: "1", name: "Test Cat", adaptability: 5, vocalisation: 3, affectionLevel: 4, socialNeeds: 2, sheddingLevel: 1, rare: 0, description: "A test cat", image: CatImage(url: "https://test.com/cat.jpg"), isBest: true)
        coreDataManager.saveCat(cat)
        Logger.shared.log("Saved cat: \(cat.name ?? "Unknown")", level: .debug)

        let isFavorite = coreDataManager.isFavorite(cat: cat)
        XCTAssertTrue(isFavorite)
        Logger.shared.log("Cat \(cat.name ?? "Unknown") isFavorite: \(isFavorite)", level: .debug)
    }

    func testRemoveCat() throws {
        Logger.shared.log("testRemoveCat() started", level: .debug)
        
        // Create a test cat
        let cat = Cat(id: "1", name: "Test Cat", adaptability: 5, vocalisation: 3, affectionLevel: 4, socialNeeds: 2, sheddingLevel: 1, rare: 0, description: "A test cat", image: CatImage(url: "https://test.com/cat.jpg"), isBest: true)
        
        coreDataManager.saveCat(cat)
        Logger.shared.log("Saved cat: \(cat.name ?? "Unknown")", level: .debug)
        
        var isFavorite = coreDataManager.isFavorite(cat: cat)
        Logger.shared.log("Cat \(cat.name ?? "Unknown") isFavorite after save: \(isFavorite)", level: .debug)
        XCTAssertTrue(isFavorite, "Cat should be a favorite after save")
        
        coreDataManager.removeCat(cat)
        Logger.shared.log("Removed cat: \(cat.name ?? "Unknown")", level: .debug)
        
        isFavorite = coreDataManager.isFavorite(cat: cat)
        Logger.shared.log("Cat \(cat.name ?? "Unknown") isFavorite after removal: \(isFavorite)", level: .debug)
        XCTAssertFalse(isFavorite, "Cat should not be a favorite after removal")
        
        let favorites = coreDataManager.fetchAllFavorites()
        Logger.shared.log("Checked if cat is removed from favorites: \(!favorites.contains { $0.id == cat.id })", level: .debug)
        XCTAssertFalse(favorites.contains { $0.id == cat.id }, "Favorites should not contain the cat after removal")
        
        Logger.shared.log("testRemoveCat() finished", level: .debug)
    }

    func testFetchAllFavorites() throws {
        let cat = Cat(id: "1", name: "Test Cat", adaptability: 5, vocalisation: 3, affectionLevel: 4, socialNeeds: 2, sheddingLevel: 1, rare: 0, description: "A test cat", image: CatImage(url: "https://test.com/cat.jpg"), isBest: true)
        
        coreDataManager.saveCat(cat)
        Logger.shared.log("Saved cat: \(cat.name ?? "Unknown")", level: .debug)
        
        let favorites = coreDataManager.fetchAllFavorites()
        XCTAssertTrue(favorites.contains { $0.id == cat.id })
        Logger.shared.log("Checked if saved cat is in favorites: \(favorites.contains { $0.id == cat.id })", level: .debug)
    }
}
