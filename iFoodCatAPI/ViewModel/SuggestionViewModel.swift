//
//  SuggestionViewModel.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import Foundation

class SuggestionViewModel {
    private var allBreeds: [Cat]
    private var selectedOptions: Set<Int> = []

    init(allBreeds: [Cat]) {
        self.allBreeds = allBreeds
    }

    var isGoButtonEnabled: Bool {
        return !selectedOptions.isEmpty
    }

    func toggleOption(at index: Int) {
        if selectedOptions.contains(index) {
            selectedOptions.remove(index)
        } else {
            selectedOptions.insert(index)
        }
    }

    func getSuggestions() -> [Cat] {
        let userWish = Suggestion(
            indoor: selectedOptions.contains(0),
            vocalize: selectedOptions.contains(1),
            lap: selectedOptions.contains(2),
            sociable: selectedOptions.contains(3),
            shedding: selectedOptions.contains(4),
            rare: selectedOptions.contains(5)
        )
        return FilterBreed.getSuggestions(breeds: allBreeds, wish: userWish)
    }
}
