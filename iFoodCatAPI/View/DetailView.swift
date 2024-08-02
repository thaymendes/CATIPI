//
//  DetailView.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit

class DetailView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let adaptabilitySlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let adaptabilityLabel: UILabel = {
        let label = UILabel()
        label.text = "Adaptabilidade"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let vocalisationSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let vocalisationLabel: UILabel = {
        let label = UILabel()
        label.text = "Vocalização"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let affectionSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let affectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Afeição"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let socialNeedsSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let socialNeedsLabel: UILabel = {
        let label = UILabel()
        label.text = "Necessidades Sociais"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let sheddingSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let sheddingLabel: UILabel = {
        let label = UILabel()
        label.text = "Queda de Pelos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let rareSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let rareLabel: UILabel = {
        let label = UILabel()
        label.text = "Raridade"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(adaptabilityLabel)
        contentView.addSubview(adaptabilitySlider)
        contentView.addSubview(vocalisationLabel)
        contentView.addSubview(vocalisationSlider)
        contentView.addSubview(affectionLabel)
        contentView.addSubview(affectionSlider)
        contentView.addSubview(socialNeedsLabel)
        contentView.addSubview(socialNeedsSlider)
        contentView.addSubview(sheddingLabel)
        contentView.addSubview(sheddingSlider)
        contentView.addSubview(rareLabel)
        contentView.addSubview(rareSlider)
        contentView.addSubview(descriptionLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // Ajuste aqui
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            adaptabilityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            adaptabilityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            adaptabilityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            adaptabilitySlider.topAnchor.constraint(equalTo: adaptabilityLabel.bottomAnchor, constant: 8),
            adaptabilitySlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            adaptabilitySlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            vocalisationLabel.topAnchor.constraint(equalTo: adaptabilitySlider.bottomAnchor, constant: 16),
            vocalisationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vocalisationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            vocalisationSlider.topAnchor.constraint(equalTo: vocalisationLabel.bottomAnchor, constant: 8),
            vocalisationSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vocalisationSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            affectionLabel.topAnchor.constraint(equalTo: vocalisationSlider.bottomAnchor, constant: 16),
            affectionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            affectionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            affectionSlider.topAnchor.constraint(equalTo: affectionLabel.bottomAnchor, constant: 8),
            affectionSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            affectionSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            socialNeedsLabel.topAnchor.constraint(equalTo: affectionSlider.bottomAnchor, constant: 16),
            socialNeedsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            socialNeedsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            socialNeedsSlider.topAnchor.constraint(equalTo: socialNeedsLabel.bottomAnchor, constant: 8),
            socialNeedsSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            socialNeedsSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            sheddingLabel.topAnchor.constraint(equalTo: socialNeedsSlider.bottomAnchor, constant: 16),
            sheddingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sheddingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            sheddingSlider.topAnchor.constraint(equalTo: sheddingLabel.bottomAnchor, constant: 8),
            sheddingSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sheddingSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            rareLabel.topAnchor.constraint(equalTo: sheddingSlider.bottomAnchor, constant: 16),
            rareLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rareLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            rareSlider.topAnchor.constraint(equalTo: rareLabel.bottomAnchor, constant: 8),
            rareSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rareSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: rareSlider.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

