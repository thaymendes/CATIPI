//
//  DetailViewModelTests.swift
//  iFoodCatAPITests
//
//  Created by Thayanne Mendes on 31/07/24.
//

import XCTest
@testable import iFoodCatAPI

class DetailViewModelTests: XCTestCase {

    var viewModel: DetailViewModel!

    override func setUp() {
        super.setUp()
        let cat = Cat(id: "1", name: "Test Cat", adaptability: 5, vocalisation: 3, affectionLevel: 4, socialNeeds: 2, sheddingLevel: 1, rare: 0, description: "A test cat", image: CatImage(url: "https://test.com/cat.jpg"), isBest: true)
        viewModel = DetailViewModel(cat: cat)
        Logger.shared.log("DetailViewModelTests setUp with cat: \(cat.name ?? "Unknown")", level: .debug)
    }

    override func tearDown() {
        viewModel = nil
        Logger.shared.log("DetailViewModelTests tearDown", level: .debug)
        super.tearDown()
    }

    func testCatName() {
        XCTAssertEqual(viewModel.name, "Test Cat")
        Logger.shared.log("Testing cat name: \(viewModel.name)", level: .debug)
    }

    func testCatAdaptability() {
        XCTAssertEqual(viewModel.adaptability, 5)
        Logger.shared.log("Testing cat adaptability: \(viewModel.adaptability)", level: .debug)
    }

    func testCatVocalisation() {
        XCTAssertEqual(viewModel.vocalisation, 3)
        Logger.shared.log("Testing cat vocalisation: \(viewModel.vocalisation)", level: .debug)
    }

    func testCatAffectionLevel() {
        XCTAssertEqual(viewModel.affectionLevel, 4)
        Logger.shared.log("Testing cat affectionLevel: \(viewModel.affectionLevel)", level: .debug)
    }

    func testCatSocialNeeds() {
        XCTAssertEqual(viewModel.socialNeeds, 2)
        Logger.shared.log("Testing cat socialNeeds: \(viewModel.socialNeeds)", level: .debug)
    }

    func testCatSheddingLevel() {
        XCTAssertEqual(viewModel.sheddingLevel, 1)
        Logger.shared.log("Testing cat sheddingLevel: \(viewModel.sheddingLevel)", level: .debug)
    }

    func testCatRare() {
        XCTAssertEqual(viewModel.rare, 0)
        Logger.shared.log("Testing cat rare: \(viewModel.rare)", level: .debug)
    }

    func testCatDescription() {
        XCTAssertEqual(viewModel.description, "A test cat")
        Logger.shared.log("Testing cat description: \(viewModel.description)", level: .debug)
    }

    func testCatImageUrl() {
        XCTAssertEqual(viewModel.imageUrl, "https://test.com/cat.jpg")
        Logger.shared.log("Testing cat imageUrl: \(viewModel.imageUrl)", level: .debug)
    }
}
