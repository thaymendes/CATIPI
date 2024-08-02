//
//  HomeViewController.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeView = HomeView()
    private var allBreeds: [Cat] = [] 

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.shared.log("HomeViewController loaded", level: .debug)
        fetchAllBreeds()
        homeView.actionButton.addTarget(self, action: #selector(navigateToSuggestion), for: .touchUpInside)
    }

    private func fetchAllBreeds() {
        API.shared.fetchCats { result in
            switch result {
            case .success(let cats):
                self.allBreeds = cats
                Logger.shared.log("Fetched \(cats.count) breeds", level: .info)
            case .failure(let error):
                Logger.shared.log("Failed to fetch breeds: \(error)", level: .error)
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
          return false
      }
    
    @objc private func navigateToSuggestion() {
        guard !allBreeds.isEmpty else {
            let alert = UIAlertController(title: "Dados não carregados", message: "As raças ainda não foram carregadas. Tente novamente.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            Logger.shared.log("Tried to navigate to suggestions but breeds were not loaded", level: .warning)
            return
        }

        let suggestionViewController = SuggestionViewController(allBreeds: allBreeds)
        navigationController?.pushViewController(suggestionViewController, animated: true)
        Logger.shared.log("Navigating to SuggestionViewController", level: .info)
    }
}
