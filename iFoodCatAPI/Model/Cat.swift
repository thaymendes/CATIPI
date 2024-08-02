//
//  Cat.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//
import Foundation

struct Cat: Codable {
    let id: String
    let name: String?
    let adaptability: Int?
    let vocalisation: Int?
    let affectionLevel: Int?
    let socialNeeds: Int?
    let sheddingLevel: Int?
    let rare: Int?
    let description: String?
    let image: CatImage?
    let isBest: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, adaptability, vocalisation, affectionLevel = "affection_level"
        case socialNeeds = "social_needs"
        case sheddingLevel = "shedding_level"
        case rare
        case description = "description"
        case image
        case isBest = "is_best"
    }
}

struct CatImage: Codable {
    let url: String?
}
