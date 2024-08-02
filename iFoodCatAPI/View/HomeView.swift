import UIKit

class HomeView: UIView {
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "title")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let subtitleAndCatsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sub")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("QUERO DESCOBRIR!", for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(titleImageView)
        addSubview(subtitleAndCatsImageView)
        addSubview(actionButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleImageView.heightAnchor.constraint(equalToConstant: 100),

            subtitleAndCatsImageView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 20),
            subtitleAndCatsImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleAndCatsImageView.widthAnchor.constraint(equalToConstant: 300),
            subtitleAndCatsImageView.heightAnchor.constraint(equalToConstant: 200),

            actionButton.topAnchor.constraint(equalTo: subtitleAndCatsImageView.bottomAnchor, constant: 40),
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 250),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
