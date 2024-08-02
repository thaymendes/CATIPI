//
//  BestCatsTableViewCell.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 30/07/24.
//

import UIKit

class BestCatsTableViewCell: UITableViewCell {
    let catImageView = UIImageView()
    let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        catImageView.contentMode = .scaleAspectFill
        catImageView.clipsToBounds = true
        catImageView.layer.cornerRadius = 10 // Para bordas arredondadas
        contentView.addSubview(catImageView)
        contentView.addSubview(nameLabel)
    }

    private func setupConstraints() {
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            catImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            catImageView.widthAnchor.constraint(equalToConstant: 100),
            catImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with cat: Cat) {
        nameLabel.text = cat.name
        if let urlString = cat.image?.url, let url = URL(string: urlString) {
            catImageView.loadImage(from: url, placeholder: UIImage(named: "defaultPlaceholder"), showLoading: true)
        }
    }
}
