//
//  Favorite CatTableViewCwll.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 30/07/24.
//

import UIKit

class FavoriteCatTableViewCell: UITableViewCell {
    let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
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
            catImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            catImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            catImageView.widthAnchor.constraint(equalToConstant: 60),
            catImageView.heightAnchor.constraint(equalToConstant: 60),

            nameLabel.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
