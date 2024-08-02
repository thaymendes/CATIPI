//
//  DetailViewController.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//
import UIKit

class DetailViewController: UIViewController {
    private let detailView = DetailView()
    private let viewModel: DetailViewModel
    private var favoriteButton: UIButton!

    init(cat: Cat) {
        self.viewModel = DetailViewModel(cat: cat)
        super.init(nibName: nil, bundle: nil)
        Logger.shared.log("DetailViewController initialized with cat: \(cat.name ?? "Unknown")", level: .info)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupFavoriteButton()
        Logger.shared.log("DetailViewController loaded", level: .debug)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
          return false
      }
    
    private func setupBindings() {
        detailView.nameLabel.text = viewModel.name
        detailView.adaptabilitySlider.value = viewModel.adaptability
        detailView.vocalisationSlider.value = viewModel.vocalisation
        detailView.affectionSlider.value = viewModel.affectionLevel
        detailView.socialNeedsSlider.value = viewModel.socialNeeds
        detailView.sheddingSlider.value = viewModel.sheddingLevel
        detailView.rareSlider.value = viewModel.rare
        detailView.descriptionLabel.text = viewModel.description

        if let url = URL(string: viewModel.imageUrl) {
            detailView.imageView.loadImage(from: url, placeholder: UIImage(named: "defaultPlaceholder"), showLoading: true)
        } else {
            Logger.shared.log("Invalid image URL", level: .error)
        }
    }

    private func setupFavoriteButton() {
        favoriteButton = UIButton(type: .custom)
        favoriteButton.setImage(UIImage(named: viewModel.isFavorite() ? "heart_filled" : "heart"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.widthAnchor.constraint(equalToConstant: 24),
            favoriteButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc private func toggleFavorite() {
        if viewModel.isFavorite() {
            viewModel.removeFromFavorites()
            favoriteButton.setImage(UIImage(named: "heart"), for: .normal)
            Logger.shared.log("Removed from favorites", level: .info)
        } else {
            viewModel.saveToFavorites()
            favoriteButton.setImage(UIImage(named: "heart_filled"), for: .normal)
            Logger.shared.log("Added to favorites", level: .info)
        }
    }
}
