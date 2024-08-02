//
//  SuggestionViewController.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit

class SuggestionViewController: UIViewController {
    private let suggestionView = SuggestionView()
    private var suggestions: [Cat]?

    override func loadView() {
        view = suggestionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.shared.log("SuggestionViewController loaded", level: .debug)
        
        suggestionView.goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        
        suggestionView.optionButtons.forEach { button in
            button.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
          return false
      }

    convenience init(allBreeds: [Cat]) {
        self.init()
        self.suggestions = allBreeds
        Logger.shared.log("SuggestionViewController initialized with \(allBreeds.count) breeds", level: .info)
    }

    @objc private func optionButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? UIColor(red: 216/255, green: 134/255, blue: 157/255, alpha: 1) : UIColor(red: 244/255, green: 232/255, blue: 238/255, alpha: 1)
        suggestionView.goButton.isEnabled = suggestionView.optionButtons.contains { $0.isSelected }
        suggestionView.goButton.backgroundColor = suggestionView.goButton.isEnabled ? UIColor(red: 216/255, green: 134/255, blue: 157/255, alpha: 1) : UIColor(red: 216/255, green: 134/255, blue: 157/255, alpha: 0.5)
        Logger.shared.log("Option button tapped. Current selected state: \(sender.isSelected)", level: .debug)
    }

    @objc private func goButtonTapped() {
        guard let suggestions = suggestions else {
            Logger.shared.log("Suggestions were nil when goButton was tapped", level: .error)
            return
        }
        
        let userWish = Suggestion(
            indoor: suggestionView.optionButtons[0].isSelected,
            vocalize: suggestionView.optionButtons[1].isSelected,
            lap: suggestionView.optionButtons[2].isSelected,
            sociable: suggestionView.optionButtons[3].isSelected,
            shedding: suggestionView.optionButtons[4].isSelected,
            rare: suggestionView.optionButtons[5].isSelected
        )

        let suggestedBreeds = FilterBreed.getSuggestions(breeds: suggestions, wish: userWish)
        if suggestedBreeds.count > 0 {
            let bestCatsViewController = BestCatsViewController(suggestions: suggestedBreeds)
            self.show(bestCatsViewController, sender: nil)
            Logger.shared.log("Found \(suggestedBreeds.count) suggested breeds. Navigating to BestCatsViewController", level: .info)
        } else {
            let alert = UIAlertController(title: "Ops, não encontramos felinos com esse perfil!", message: "Escolha mais características!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            Logger.shared.log("No breeds found for the given suggestions", level: .warning)
        }
    }
}

