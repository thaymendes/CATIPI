//
//  FavoritesViewController.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private var favoriteCats: [FavoriteCat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavoriteCats()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
          return false
      }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteCatCell.self, forCellReuseIdentifier: "FavoriteCell")
    }

    private func setupNavigationBar() {
        self.navigationItem.title = "Favoritos"
    }

    private func fetchFavoriteCats() {
        favoriteCats = CoreDataManager.shared.fetchAllFavorites()
        tableView.reloadData()
        Logger.shared.log("Fetched \(favoriteCats.count) favorite cats", level: .info)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteCats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCatCell
        let cat = favoriteCats[indexPath.row]
        cell.configure(with: cat)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cat = favoriteCats[indexPath.row]
        let detailViewController = DetailViewController(cat: Cat(id: cat.id ?? "", name: cat.name, adaptability: Int(cat.adaptability), vocalisation: Int(cat.vocalisation), affectionLevel: Int(cat.affectionLevel), socialNeeds: Int(cat.socialNeeds), sheddingLevel: Int(cat.sheddingLevel), rare: Int(cat.rare), description: cat.catDescription, image: CatImage(url: cat.imageUrl), isBest: false))
        navigationController?.pushViewController(detailViewController, animated: true)
        Logger.shared.log("Selected favorite cat: \(cat.name ?? "Unknown"). Navigating to DetailViewController", level: .info)

    }
}

class FavoriteCatCell: UITableViewCell {
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(catImageView)
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            catImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            catImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            catImageView.widthAnchor.constraint(equalToConstant: 50),
            catImageView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(with cat: FavoriteCat) {
        nameLabel.text = cat.name
        if let urlString = cat.imageUrl, let url = URL(string: urlString) {
            catImageView.loadImage(from: url, placeholder: UIImage(named: "defaultPlaceholder"), showLoading: true)
        }
    }
}
