//
//  SuggestionView.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit

class SuggestionView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Conte para nós, qual o seu perfil de gatinho ideal:"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let goButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DESCOBRIR!", for: .normal)
        button.isEnabled = false
        button.backgroundColor = .systemPink.withAlphaComponent(0.5)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let optionButtons: [UIButton] = {
        let titles = ["Gosta de apartamento", "Gosta de 'cantar' alto", "Gosta de um colinho", "É sociável", "Peludinho", "Raro"]
        return titles.map { title in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.backgroundColor =  UIColor(red: 244/255, green: 232/255, blue: 238/255, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 10
            return button
        }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(titleLabel)
        optionButtons.forEach { addSubview($0) }
        addSubview(goButton)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        optionButtons.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            optionButtons[0].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            optionButtons[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            optionButtons[0].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            optionButtons[0].heightAnchor.constraint(equalToConstant: 50),
            
            optionButtons[1].topAnchor.constraint(equalTo: optionButtons[0].bottomAnchor, constant: 10),
            optionButtons[1].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            optionButtons[1].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            optionButtons[1].heightAnchor.constraint(equalToConstant: 50),
            
            optionButtons[2].topAnchor.constraint(equalTo: optionButtons[1].bottomAnchor, constant: 10),
            optionButtons[2].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            optionButtons[2].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            optionButtons[2].heightAnchor.constraint(equalToConstant: 50),
            
            optionButtons[3].topAnchor.constraint(equalTo: optionButtons[2].bottomAnchor, constant: 10),
            optionButtons[3].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            optionButtons[3].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            optionButtons[3].heightAnchor.constraint(equalToConstant: 50),
            
            optionButtons[4].topAnchor.constraint(equalTo: optionButtons[3].bottomAnchor, constant: 10),
            optionButtons[4].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            optionButtons[4].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            optionButtons[4].heightAnchor.constraint(equalToConstant: 50),
            
            optionButtons[5].topAnchor.constraint(equalTo: optionButtons[4].bottomAnchor, constant: 10),
            optionButtons[5].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            optionButtons[5].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            optionButtons[5].heightAnchor.constraint(equalToConstant: 50),
            
            goButton.topAnchor.constraint(equalTo: optionButtons[5].bottomAnchor, constant: 20),
            goButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            goButton.widthAnchor.constraint(equalToConstant: 200),
            goButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
